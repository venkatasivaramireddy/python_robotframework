from robot.api.deco import keyword
from requests import request
import winrm
from base64 import b64encode
import time
import traceback
from SSHLibrary import SSHLibrary

@keyword(name="API Request")
def api_calling(url):
    response = request(method="GET",url=url)
    data = response.json()
    if response.status_code == 200:
        return True
    else: return False


def _run_win_cmd_with_retry(target_ip, cmd,u_name,p_word, ps=False, max_retry = 5, chan_timeout=300, _exit=True):

    retry = 0
    while retry < max_retry:
        try:
            wincon = winrm.Session(target_ip, auth=(u_name, p_word),
                                        transport='ntlm', read_timeout_sec=chan_timeout,
                                        operation_timeout_sec=chan_timeout - 10)
            if ps == True:
                encoded_ps = b64encode(cmd.encode('utf_16_le')).decode('ascii')
                cmd = 'powershell -encodedcommand {0}'.format(encoded_ps)

            prtl = wincon.protocol
            shell_id = prtl.open_shell()
            command_id = prtl.run_command(shell_id, cmd)
            stdout_buffer, stderr_buffer = [], []
            command_done = False
            return_code = -1
            while not command_done:
                try:
                    stdout, stderr, return_code, command_done = prtl._raw_get_command_output(shell_id, command_id)
                    stdout_buffer.append(stdout)
                    stderr_buffer.append(stderr)
                except Exception as e:
                    stdout_buffer.append(b'_chan_closed')
                    stderr_buffer.append(b'_chan_closed')
                    if not _exit:
                        continue
                    else:
                        command_done = True
            rs = winrm.Response((b''.join(stdout_buffer), b''.join(stderr_buffer), return_code))
            prtl.cleanup_command(shell_id, command_id)
            prtl.close_shell(shell_id)
            return rs
        except Exception as e:
            time.sleep(5)
            retry += 1
            wincon = winrm.Session(target_ip, auth=(u_name, p_word),
                                        transport='ntlm', read_timeout_sec=chan_timeout,
                                        operation_timeout_sec=chan_timeout - 10)

            if retry == max_retry:
                print("got below exception while connecting to : {0} \n {1}".format(target_ip, traceback.format_exc()))
            else:
                continue


@keyword(name="Execute command in windows")
def windows_execute(u,p,ip,cmd,ps=False):
    u_name = u
    p_word = p
    cmd_out = _run_win_cmd_with_retry(ip, cmd, u_name, p_word,ps)
    response = cmd_out.std_err.decode("utf-8")
    return response


@keyword(name="Execute command in Linux")
def _run_command_linux_os(target_ip, u_name, p_word, cmd,pem_key_path=''):
    ssh = SSHLibrary()
    ssh.open_connection(target_ip)
    if pem_key_path:
        ssh.login(u_name, pkey=pem_key_path)
    else:
        ssh.login(u_name, p_word)
    output, err, rc = ssh.execute_command(cmd, return_stderr=True, return_rc=True)
    return output, err, rc



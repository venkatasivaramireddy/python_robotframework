*** settings ***
Library        BuiltIn
Resource    ../Resource/common_resource.robot

*** Variables ***
${username}     Administrator
${password}     P@ssword1
${vm_ip}        10.32.26.202

*** Test Cases ***

Testcase 01 :: Windows sample testcase executious in cmd
    [Documentation]     To define description of this testcase and points here...

    [Tags]      Robot_framework     windows-sample

    [Setup]     log to console      Running setup Keywords

    Windows cmd sample testcase keyword     ${username}     ${password}     ${vm_ip}

    [Teardown]    log to console      Running Teardown Keywords

Testcase 02 :: Windows sample testcase executious in powershell
    [Documentation]     To define description of this testcase and points here...

    [Tags]      Robot_framework     windows-sample

    [Setup]     log to console      Running setup Keywords

    Windows powershell sample testcase keyword     ${username}     ${password}     ${vm_ip}     ps=True

    [Teardown]    log to console      Running Teardown Keywords
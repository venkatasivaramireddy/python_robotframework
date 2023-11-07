*** Settings ***
Library        BuiltIn
Library     ../../Library/common.py

*** Keywords ***

API validation keyword
    [Arguments]         ${url_path}     ${pin_code}
    ${cmd} =   Catenate   ${url_path}${pin_code}

    Log To Console    ${cmd}

    ${resp}=     API Request     ${cmd}

    Log To Console    ${resp}

    ${value}=      convert to string   ${resp}
    should be equal        ${value}       True

Multiple API validation keyword
    [Arguments]         ${url_path}     ${pin_code}

    FOR    ${i}     IN     @{pin_code}
        ${cmd} =   Catenate   ${url_path}${i}

        Log To Console    ${cmd}

        ${resp}=     API Request     ${cmd}

        Log To Console    ${resp}

        ${value}=      convert to string   ${resp}
        should be equal        ${value}       True
    END

Windows cmd sample testcase keyword
    [Arguments]         ${uername}     ${password}      ${ip}
#    ${cmd} =   Catenate    cd ..; dir  -> for Powershell
#    ${cmd} =   Catenate    cd .. && dir  -> for command line

    ${cmd} =   Catenate    dir
    Log To Console    ${cmd}
    ${resp}=     Execute command in windows    ${uername}     ${password}      ${ip}    ${cmd}

    Log To Console    ${resp}

Windows powershell sample testcase keyword
    [Arguments]         ${uername}     ${password}      ${ip}
#    ${cmd} =   Catenate    cd ..; dir  -> for Powershell
#    ${cmd} =   Catenate    cd .. && dir  -> for command line

    ${cmd} =   Catenate    dir
    Log To Console    ${cmd}
    ${resp}=     Execute command in windows    ${uername}     ${password}      ${ip}    ${cmd}

    Log To Console    ${resp}


Linux sample testcase keyword
    [Arguments]         ${uername}     ${password}      ${ip}

    ${cmd} =   Catenate    ls
    Log To Console    ${cmd}
    ${resp}=     Execute command in Linux      ${ip}    ${uername}     ${password}}    ${cmd}

    Log To Console    ${resp}


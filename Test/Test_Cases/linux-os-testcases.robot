*** settings ***
Library        BuiltIn
Resource    ../Resource/common_resource.robot

*** Variables ***
${username}     admin
${password}     1234567890
${vm_ip}        *.*.*.*

*** Test Cases ***

Testcase 01 :: Linux sample testcase executious
    [Documentation]     To define description of this testcase and points here...

    [Tags]      Robot_framework     windows-sample

    [Setup]     log to console      Running setup Keywords

    Linux sample testcase keyword     ${username}     ${password}     ${vm_ip}

    [Teardown]    log to console      Running Teardown Keywords

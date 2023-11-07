*** Settings ***
Library        BuiltIn
Resource    ../Resource/common_resource.robot

*** Variables ***
${url_path}     https://api.postalpincode.in/pincode/
${pin_code}     500001
@{pin_code_list}    500001      500002      500003

*** Test Cases ***

Testcase 01 :: API Validation using single pincode
    [Documentation]     To define description of this testcase and points here...

    [Tags]      Robot_framework     single-API-validation

    [Setup]     log to console      Running setup Keywords

    API validation keyword      ${url_path}     ${pin_code}

    [Teardown]    log to console      Running Teardown Keywords

Testcase 01 :: API Validation using multiple pincode
    [Documentation]     To define description of this testcase and points here...

    [Tags]      Robot_framework     multiple-API-validation

    [Setup]     log to console      Running setup Keywords

    Multiple API validation keyword      ${url_path}     ${pin_code_list}

    [Teardown]    log to console      Running Teardown Keywords

# Here i am taking one india postal API for testing - https://api.postalpincode.in/pincode/{PINCODE}
# Let me automate this api validation using robot framework.
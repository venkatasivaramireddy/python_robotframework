
*** Settings ***
Resource    ../Resource/First_keyword.robot
Variables    ../../Library/variables.py


*** Variables ***
${FIRSTNAME} =  ${ONE}

*** Test Cases ***

Test Variables
    Log     Testing varianles 1
    Log     ${FIRSTNAME}
    Log     Done


#MyFirstTest
#    Log     Hello World!!!
#
#SecondTest With Keyword Calling
#    Log     Hello World!!!
#    First Key Word
#    Log     Second Test Case Done
#
#ThirdTest With Keyword Calling
#    Log     Hello World!!!
#    Third Key Word
#    Log     Second Test Case Done
#
#TestCase With Documentation
#    [Documentation]  This desciption keyword is used to like title of test case
#    Log     Hello World!!!
#    Third Key Word
#    Log     Second Test Case Done
#
#TestCase With Tag
#    [Documentation]  This desciption keyword is used to like title of test case
#    [tags]  Tag-Test
#    Log     Hello World!!!
#    Third Key Word
#    Log     Second Test Case Done
#
#TestCase With Teardown
#    [Description]  This desciption keyword is used to like title of test case
#    [tags]  Tag-Test
#    Log     Hello World!!!
#    Third Key Word
#    Log     Second Test Case Done



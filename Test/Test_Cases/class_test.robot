
*** Settings ***
Library           ../../Library/Class_Test.py    ${2}    ${1}

*** Test Cases ***
Addition
    [tags]  addition
    ${result}=    Class_Test.addition
    Log     "hello"
    Log    ${result}

Multiply
    [tags]  Multiply
    ${result}=    Class_Test.multiply
    Log     "hello"
    Log    ${result}
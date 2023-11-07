
*** Settings ***
Variables    ../Resource/First_variable.robot
Library     ../Library/first_test_module.py

*** Variables  ***
${ONE}      Test variable

*** keywords ***
First Key Word
    Log     ${ONE}
    Log     Welcome to first key word

Third Key Word
    Log     ${ONE}
    ${Result}=  Method One      10
    Log     ${Result}
    Log     Welcome to first key word
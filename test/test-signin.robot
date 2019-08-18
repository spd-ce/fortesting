*** Settings ***
Test Teardown   Close Browser
Library    Selenium2Library

*** Variables ***
${url_signin}    https://spd-ce.github.io/fortesting/signin.html
${title_signin}    Sign In
${txt_user}      //*[@id="txt_username"]
${txt_pass}       //*[@id="txt_password"]
${btn_signin}      //*[@id="btn_signin"]
${username_success}    cekmitl
${pass_success}    ecc56789
${username_fail}    cekmitl_Failed
${pass_fail}      ecc567899999
${signin_fail}     //*[@id="error_alert"]
${signin_pass}     Home
${fail_text}      Please enter valid username and password!

*** Test Cases ***
Sign-in valid with email and password
    [Tags]    successful-case
    Open Browser    ${url_signin}    chrome
    Verify Title Page    ${title_signin}
    Input Username and Password    ${txt_user}    ${txt_pass}    ${username_success}    ${pass_success}
    Click Button Signin    ${btn_signin}
    Verify Title Page    ${signin_pass}

Sign-in with invalid email and password
    [Tags]    failed-case
    Open Browser    about:blank    chrome
    Go To    ${url_signin}
    Verify Title Page    ${title_signin}
    Input Username and Password    ${txt_user}    ${txt_pass}    ${username_fail}    ${pass_fail}
    Click Button Signin    ${btn_signin}
    Verify Signin    ${signin_fail}    ${fail_text}

*** Keywords ***
Verify Title Page
    [Arguments]    ${title}
    Title Should Be    ${title}

Input Username and Password
    [Arguments]    ${xpath_user}    ${xpath_pass}    ${username}    ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text    ${xpath_user}    ${username}
    Input Text    ${xpath_pass}    ${password}

Click Button Signin
    [Arguments]    ${btn}
    Element Should Be Visible    ${btn}
    Click Element    ${btn}

Verify Signin
    [Arguments]    ${xpath}    ${text}
    Element Should Be Visible    ${xpath}
    Element Should Contain     ${xpath}    ${text}

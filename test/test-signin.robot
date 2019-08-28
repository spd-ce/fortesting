*** Settings ***
Test Teardown   Close Browser
Library    Selenium2Library



*** Variables ***
${url_signin}    https://spd-ce.github.io/fortesting/signin.html
${textbox_username}      //*[@id="txt_username"]
${textbox_password}      //*[@id="txt_password"]
${button_signin}      //*[@id="btn_signin"]
${alert_box_error}     //*[@id="error_alert"]



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



*** Test Cases ***
T0001 Sign-in valid with email and password
    [Tags]    successful-case
    Open Browser    ${url_signin}    chrome
    Verify Title Page    Sign In
    Input Username and Password    ${textbox_username}    ${textbox_password}   cekmitl    ecc56789
    Click Button Signin    ${button_signin}
    Verify Title Page    Home


T0002 Sign-in with valid email and invalid password
    [Tags]    failed-case
    Open Browser    about:blank    chrome
    Go To    ${url_signin}
    Verify Title Page    Sign In
    Input Username and Password    ${textbox_username}    ${textbox_password}   cekmitl    ecc56789_x
    Click Button Signin    ${button_signin}
    Verify Signin    ${alert_box_error}    Please enter valid username and password!


T0003 Sign-in with invalid email and valid password
    [Tags]    failed-case
    Open Browser    about:blank    chrome
    Go To    ${url_signin}
    Verify Title Page    Sign In
    Input Username and Password    ${textbox_username}    ${textbox_password}   cekmitl_x    ecc56789
    Click Button Signin    ${button_signin}
    Verify Signin    ${alert_box_error}    Please enter valid username and password!


T0004 Sign-in with invalid email and invalid password
    [Tags]    failed-case
    Open Browser    about:blank    chrome
    Go To    ${url_signin}
    Verify Title Page    Sign In
    Input Username and Password    ${textbox_username}    ${textbox_password}   cekmitl_x    ecc56789_x
    Click Button Signin    ${button_signin}
    Verify Signin    ${alert_box_error}    Please enter valid username and password!

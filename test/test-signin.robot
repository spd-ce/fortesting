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



*** Test Cases ***
T0001 Sign-in valid with username and password
    [Tags]    successful-case
    Open Browser    ${url_signin}    chrome
    Title Should Be    Sign In
    Input Text    ${textbox_username}    cekmitl
    Input Text    ${textbox_password}   ecc56789
    Click Element    ${button_signin}
    Title Should Be    Home


T0002 Sign-in with valid username and invalid password
    [Tags]    failed-case
    Open Browser    ${url_signin}    chrome
    Title Should Be    Sign In
    Input Text    ${textbox_username}    cekmitl
    Input Text    ${textbox_password}   ecc56789_x
    Click Element    ${button_signin}
    Element Should Contain    ${alert_box_error}    Please enter valid username and password!


T0003 Sign-in with invalid username and valid password
    [Tags]    failed-case
    Open Browser    ${url_signin}    chrome
    Title Should Be    Sign In
    Input Text    ${textbox_username}    cekmitl_x
    Input Text    ${textbox_password}   ecc56789
    Click Element    ${button_signin}
    Element Should Contain    ${alert_box_error}    Please enter valid username and password!


T0004 Sign-in with invalid username and invalid password
    [Tags]    failed-case
    Open Browser    ${url_signin}    chrome
    Title Should Be    Sign In
    Input Text    ${textbox_username}    cekmitl_x
    Input Text    ${textbox_password}   ecc56789_x
    Click Element    ${button_signin}
    Element Should Contain    ${alert_box_error}    Please enter valid username and password!

*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    elements.robot

*** Variables ***
${BASE_URL}     https://teste-rede.selftestplatform.com/tcm/testplan.htm?testplanid=1183#!/TESTEHZ

*** Keywords ***
Start Session
    Open Browser                    about:blank      headlesschrome
    Set Selenium Implicit Wait      30
    Maximize Browser Window

End Session
    Close Browser
    Sleep   5
Logged with "${email}"
    Start Session
    Go To      ${BASE_URL}

    Input Text          ${INPUT_EMAIL}       ${email}
    Click Element       ${BUTTON_LOGIN}

    Page Should Contain Element     ${DIV_DASH}

End Test
    Capture Page Screenshot	
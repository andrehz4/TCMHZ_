*** Settings ***
Library     SeleniumLibrary

Resource    elements.robot

*** Variables ***
${BASE_URL}     https://rede.selftestplatform.com/tcm/testplan.htm?testplanid=1256

*** Keywords ***
Start Session
    Open Browser                    about:blank      chrome
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
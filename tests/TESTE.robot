*** Settings ***
Documentation       REDE - ACESSAR O SITE DA REDE
Library     SeleniumLibrary
Library     Collections

*** Test Cases ***
REDE
    Dado que acesso o site da REDE 
								

            
*** Keywords ***
Dado que acesso o site da REDE  
    Set Selenium Implicit Wait      10
    Open Browser                    about:blank      chrome
    Maximize Browser Window
    Go to       https://teste-rede.selftestplatform.com/tcm/testplan.htm?testplanid=1183#!/THAIS        
    Input Text                              id:email                     andre.zimermann@ul.com
    Input Text                              id:password                  Rede@123
    Click Element	                        id:loginButton       
    Capture Page Screenshot                             
	Sleep                                   5
    Close Browser

    








  
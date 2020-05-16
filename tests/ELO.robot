*** Settings ***
Documentation       ELO - ACESSAR O SITE DA ELO
Library     SeleniumLibrary
Library     Collections

*** Test Cases ***
oi
    Dado que acesso o site da ELO 
								

            
*** Keywords ***
Dado que acesso o site da ELO  
    Set Selenium Implicit Wait      10
    Open Browser                    about:blank      chrome
    Maximize Browser Window
    Go to                                   https://teste-rede.selftestplatform.com/tcm/testplan.htm?testplanid=1183#!/THAIS
    Input Text                              id:username                                    teste
    Input Text                              id:password                                    teste
    Press Keys	                            id:password                                    
	Sleep                                   5
    Close Browser


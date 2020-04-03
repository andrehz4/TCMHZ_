*** Settings ***
Documentation       TCM - CAMPO OBJETIVOS
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo objetivos com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP
    rafael.ribeiro@ul.com       S@fra2019                          Rascunho
    

TRANSAÇÕES sem applicabilities
    [Template]      Cadastro do campo OBJETIVO sem applicabilities
    #CT            #Objetivo                                      
	TESTEHZ       1

TRANSAÇÕES com applicabilities
    [Template]      Cadastro do campo OBJETIVO com applicabilities
    #CT             #Objetivo                                      #Applicabilities
    TESTEHZ2        1                                              CDA supported               

*** Keywords ***
Tentar logar na RSTP
    [Arguments]     ${email}    ${password}    ${expect_message}

    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo OBJETIVO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivo}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivo}" 
    Então a seção é salva e o cadastro do campo objetivos é encerrado
    
Cadastro do campo OBJETIVO com applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivo}     ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivo}"
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em objetivos
    Então a seção é salva e o cadastro do campo objetivos é encerrado 


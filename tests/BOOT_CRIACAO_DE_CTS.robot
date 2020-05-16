*** Settings ***
Documentation       TCM - CRIAÇÃO DE CTs
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities 
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Criação de Cts
    andre.zimermann@ul.com       Rede@123                          Rascunho                     
    

CRIAÇÃO DE CTS sem applicabilities
    [Template]      Cadastro do campo CRIAÇÃO DE CTS sem applicabilities
    #CT         Nome do CT		TRANSACAO		Regra		Valor		formato										
	TESTEHZ												
	TESTEHZ2											
	TESTEHZ3											
	TESTEHZ4										

            
*** Keywords ***
Tentar logar na RSTP Criação de Cts
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo CRIAÇÃO DE CTS sem applicabilities
    [Arguments]     ${caso_de_teste}  
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Criação de Cts
    Quando é preenchido o campo Criação de Cts "${caso_de_teste}" e clico no botão OK 
    Dado que crio um caso de teste "${caso_de_teste}" e clico no botão de editar
    Dado que crio e acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Dado que crio e acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Host
    Então a seção é salva e o cadastro do campo validações de host é encerrado




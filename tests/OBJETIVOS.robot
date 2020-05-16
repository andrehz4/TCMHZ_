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
    andre.zimermann@ul.com       Rede@123                          Rascunho
    

TRANSAÇÕES sem applicabilities
    [Template]      Cadastro do campo OBJETIVO sem applicabilities
    #CT                         #Objetivo                                      
	TESTEHZ		                TESTEOI

TRANSAÇÕES com applicabilities
    [Template]      Cadastro do campo OBJETIVO com applicabilities
    #CT             #Objetivo                                      #Applicabilities
    ESTATISTICA-CH-HF-001		2Realizar a validação do mapa de bits e a correta contabilização dos campos em uma mensagem de estatística, quando realizado uma sequência de transações de crédito, débito e voucher, aprovadas com cartões de chip e tarja magnética.      CDA supported
                                                       




*** Keywords ***
Tentar logar na RSTP
    [Arguments]     ${email}    ${password}    ${expect_message}

    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo OBJETIVO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivos}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivos}" 
    Então a seção é salva e o cadastro do campo objetivos é encerrado
    
Cadastro do campo OBJETIVO com applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivo}     ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivo}"
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em objetivos
    Então a seção é salva e o cadastro do campo objetivos é encerrado 


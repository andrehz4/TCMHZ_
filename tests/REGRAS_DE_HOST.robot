*** Settings ***
Documentation       TCM - CAMPO REGRAS DE HOST
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo as Regras de host com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Regras de host
    andre.zimermann@ul.com       Rede@123                          Rascunho
    

REGRAS DE HOST sem applicabilities
    [Template]      Cadastro do campo REGRAS DE HOST sem applicabilities
    #CT                         #Transação      #Regra                              #Valor      #Seletor de Perfil  
    TESTEHZ		venda		APPROVE		${EMPTY}		Hex										
	TESTEHZ		venda		APPROVE		${EMPTY}		Hex										
	TESTEHZ		venda		APPROVE		${EMPTY}		Hex																			
																								
																																			

*** Keywords ***
Tentar logar na RSTP Regras de host
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo REGRAS DE HOST sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}    ${regra}   ${valor}  ${seletor_de_perfil}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Regras de host
    Quando é preenchido o campo Regras de host "${transacao}", com a regra ${regra}, o valor ${valor} e com o seletor de perfil ${seletor_de_perfil}     
    Então a seção é salva e o cadastro do campo Regras de host é encerrado
    



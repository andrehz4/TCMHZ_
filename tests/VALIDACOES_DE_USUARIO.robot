*** Settings ***
Documentation       TCM - CAMPO VALIDAÇÕES DE USUÁRIO
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo validações de Usuário com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Validações de Usuário
    andre.zimermann@ul.com       Rede@123                          Rascunho
    

VALIDAÇÕES DE USUÁRIO sem applicabilities
    [Template]      Cadastro do campo VALIDAÇÕES DE USUÁRIO sem applicabilities
    #CT             			 #Transação      #Valor esperado     #Descrição
	ESTATISTICA-CH-HF-001        Venda12         Yes           		Transação foi aprovada	 	
    ESTATISTICA-CH-HF-001        ESTORNO1        No					Transação foi rejeitada    
   	          

*** Keywords ***
Tentar logar na RSTP Validações de Usuário
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo VALIDAÇÕES DE USUÁRIO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}    ${valor_esperado}   ${descricao}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Usuário
    Quando é preenchido o campo validações de Usuário "${transacao}", o valor esperado ${valor_esperado} e com a descrição ${descricao}     
    Então a seção é salva e o cadastro do campo validações de Usuário é encerrado
    



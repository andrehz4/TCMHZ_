*** Settings ***
Documentation       TCM - CAMPO VALIDAÇÃO DOS TRIGGERS DE TRANSAÇÃO
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo Triggers de transação com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Triggers de transação
    andre.zimermann@ul.com       Rede@123                          Rascunho
    

TRIGGERS DE TRANSAÇÃO sem applicabilities
    [Template]      Cadastro do campo TRIGGERS DE TRANSAÇÃO sem applicabilities
    #CT                         #Transação      #Nome do cartão      #Quantidade em cima  #Quantidade embaixo       #Repetidor        #Classe de mensagem    
	TESTEHZ		venda			REDE_018 - 6799998900000200010		3000		3000		0		0200						
	TESTEHZ		venda		    REDE_020 - 6799998900000200010		3100		3100		0		0200						
	TESTEHZ		venda		    REDE_047 - 6799998900000200010		3300		3300		0		0200						
	TESTEHZ		venda		    REDE_017 - 4761739001010010			3400		3400		0		0200						
	
    

*** Keywords ***
Tentar logar na RSTP Triggers de transação
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo TRIGGERS DE TRANSAÇÃO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}    ${nome_do_cartao}   ${quantidade_cima}  ${quantidade_baixo}    ${repetidor}   ${classe_de_mensagem} 
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Triggers de transação
    Quando é preenchido o campo Triggers de transação "${transacao}", com o nome do cartão ${nome_do_cartao}, a quantidade no box de cima ${quantidade_cima}, a quantidade no box de baixo ${quantidade_baixo}, o repetidor ${repetidor} e com a classe de mensagem ${classe_de_mensagem}     
    Então a seção é salva e o cadastro do campo Triggers de transação é encerrado
    



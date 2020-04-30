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
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

TRIGGERS DE TRANSAÇÃO sem applicabilities
    [Template]      Cadastro do campo TRIGGERS DE TRANSAÇÃO sem applicabilities
    #CT                         #Transação      #Nome do cartão      #Quantidade em cima  #Quantidade embaixo       #Repetidor        #Classe de mensagem    
	TESTEHZ		venda		REDE_018 - 6799998900000200010		3000		3000		0		0200						
	TESTEHZ		venda2		    REDE_020 - 6799998900000200010		3100		3100		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		3300		3300		0		0200						
	TESTEHZ		venda2		    REDE_017 - 4761739001010010		3400		3400		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		3500		3500		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		3600		3600		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		3700		3700		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		3900		3900		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		4000		4000		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		4100		4100		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		4200		4200		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		43000		43000		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		4400		4400		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		4500		4500		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		7700		7700		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		4700		4700		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		4800		4800		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		5100		5100		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		5100		5100		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		5200		5200		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		5200		5200		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		5500		5500		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		5600		5600		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		6000		6000		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		6100		6100		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		6200		6200		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		3201		3201		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		7100		7100		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		7100		7100		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		7100		7100		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		7200		7200		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		7400		7400		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		7600		7600		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		5700		5700		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		5800		5800		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		5900		5900		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		601		601		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		602		602		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		1201		1201		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		1500		1500		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		1501		1501		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		102		102		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		200		200		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		502		502		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		301		301		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		201		201		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		103		103		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		104		104		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		300		300		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		1202		1202		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		1203		1203		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		202		202		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		1102		1102		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		1102		1102		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		1100		1100		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		1012		1012		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		1281		1281		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		1282		1282		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		1285		1285		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		1331		1331		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		106		106		0		0200						
	TESTEHZ		venda		REDE_020 - 6799998900000200010		1333		1333		0		0200						
	TESTEHZ		venda		REDE_047 - 6799998900000200010		1000		1000		0		0200						
	TESTEHZ		venda		REDE_017 - 4761739001010010		250		250		0		0200						
	TESTEHZ		venda		REDE_019 - 6799998900000200010		1250		1250		0		0200						
	TESTEHZ		venda		REDE_018 - 6799998900000200010		1104		1104		0		0200						
    

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
    



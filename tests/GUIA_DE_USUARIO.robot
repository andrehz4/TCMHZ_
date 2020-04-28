*** Settings ***
Documentation       TCM - CAMPO GUIA DE USUÁRIOS
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo guia de usuário com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test


*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Guia de usuário
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

GUIA DE USUÁRIO sem applicabilities
    [Template]      Cadastro do campo GUIA DE USUÁRIO sem applicabilities
    #CT             #Transação      #Descrição     	
	AMEX CTLS - AXP EP019		Venda		Realize um Crédito à Vista de R$ 2,02
	AMEX CTLS - AXP EP019		Venda		RAproxime o cartão CTLS XP Mobile 03
	AMEX CTLS - AXP EP019		Venda		RAguarde o processamento
	AMEX CTLS - AXP EP019		Venda		RSolicite a impressão dos comprovantes	
	AMEX CTLS - AXP EP020		Venda1		Realize um Crédito à Vista de R$ 11,02
	AMEX CTLS - AXP EP020		Venda1		Aproxime o cartão CTLS XP Mobile 02
	AMEX CTLS - AXP EP020		Venda1		Quando instruído a ver o telefone para obter instruções, desaproxime o cartão XP Mobile 02 		
	AMEX CTLS - AXP EP020		Venda2		Aproxime o cartão CTLS XP Mobile 04 - EP020	
	AMEX CTLS - AXP EP020		Venda2		Aguarde o processamento	
	AMEX CTLS - AXP EP020		Venda2		Transação é negada
	AMEX CTLS - AXP EP021		Venda		Realize um Crédito à Vista de R$ 11,00	
	AMEX CTLS - AXP EP021		Venda		Aproxime o cartão CTLS XP Card 05 - EP021	
	AMEX CTLS - AXP EP021		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP021		Venda		Terminal habilita a interface chip para prosseguir com a transação	
	AMEX CTLS - AXP EP023		Venda		Realize um Crédito à Vista de R$ 10,12	
	AMEX CTLS - AXP EP023		Venda		Aproxime o cartão CTLS XP Card 11
	AMEX CTLS - AXP EP023		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP023		Venda		Solicite a impressão dos comprovantes
	AMEX CTLS - AXP EP084		Venda		Realize um Crédito à Vista de R$ 12,81	
	AMEX CTLS - AXP EP084		Venda		Aproxime o cartão CTLS XP Card 10	
	AMEX CTLS - AXP EP084		Venda		Quando solicitado a senha, digite: 4321	
	AMEX CTLS - AXP EP084		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP084		Venda		Transação é negada
	AMEX CTLS - AXP EP085		Venda		Realize um Crédito à Vista de R$ 12,82	
	AMEX CTLS - AXP EP085		Venda		Aproxime o cartão CTLS XP Card 10	
	AMEX CTLS - AXP EP085		Venda		Quando solicitado a senha, digite: 4321	
	AMEX CTLS - AXP EP085		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP085		Venda		Transação é negada
	AMEX CTLS - AXP EP088		Venda		Realize um Crédito à Vista de R$ 12,85
	AMEX CTLS - AXP EP088		Venda		Aproxime o cartão CTLS XP Card 10
	AMEX CTLS - AXP EP088		Venda		Quando solicitado a senha, digite: 112233	
	AMEX CTLS - AXP EP088		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP088		Venda		Transação é negada
	AMEX CTLS - AXP EP090		Venda		Realize um Crédito à Vista de R$ 13,31	
	AMEX CTLS - AXP EP090		Venda		Aproxime o cartão CTLS XP Mobile 06	
	AMEX CTLS - AXP EP090		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP090		Venda		Solicite a impressão dos comprovantes	
	AMEX CTLS - AXP EP091		Venda		Realize um Crédito à Vista de R$ 1,06
	AMEX CTLS - AXP EP091		Venda		Aproxime o cartão CTLS XP Mobile 08	
	AMEX CTLS - AXP EP091		Venda		Aguarde o processamento	
	AMEX CTLS - AXP EP091		Venda		Solicite a impressão dos comprovantes	
	AMEX CTLS - AXP EP092		Venda		Realize um Crédito à Vista de R$ 13,33
	AMEX CTLS - AXP EP092		Venda		Aproxime o cartão CTLS XP Card 12
	AMEX CTLS - AXP EP092		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP092		Venda		Solicite a impressão dos comprovantes	
	AMEX CTLS - AXP EP094		Venda		Realize um Crédito à Vista de R$ 10,00
	AMEX CTLS - AXP EP094		Venda		Aproxime o cartão CTLS XP Mobile 07
	AMEX CTLS - AXP EP094		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP094		Venda		Transação é negada	
	AMEX CTLS - AXP EP095		Venda		Realize um Crédito à Vista de R$ 2,50
	AMEX CTLS - AXP EP095		Venda		Aproxime o cartão CTLS XP Mobile 08
	AMEX CTLS - AXP EP095		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP095		Venda		Solicite a impressão dos comprovantes	
	AMEX CTLS - AXP EP097		Venda		Realize um Crédito à Vista de R$ 12,50
	AMEX CTLS - AXP EP097		Venda		Aproxime o cartão CTLS XP Mobile 08
	AMEX CTLS - AXP EP097		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP097		Venda		Solicite a impressão dos comprovantes
	AMEX CTLS - AXP EP099		Venda		Realize um Crédito à Vista de R$ 11,04
	AMEX CTLS - AXP EP099		Venda		Aproxime o cartão CTLS XP Card 13
	AMEX CTLS - AXP EP099		Venda		Aguarde o processamento
	AMEX CTLS - AXP EP099		Venda		Solicite a impressão dos comprovantes
	

	    
GUIA DE USUÁRIO com applicabilities
    [Template]      Cadastro do campo GUIA DE USUÁRIO com applicabilities
    #CT             #Transação      #Descrição     #Applicabilities
    
                    
*** Keywords ***
Tentar logar na RSTP Guia de usuário
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo GUIA DE USUÁRIO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}    ${descricao}   
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "Guia de usuário"
    Quando é preenchido o campo guia de usuário "${transacao}" com a sua descrição "${descricao}"
    Então a seção é salva e o cadastro do campo Guia de usuário é encerrado

Cadastro do campo GUIA DE USUÁRIO com applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}   ${localizador}   ${valor}  ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "Guia de usuário"
    Quando é preenchido o campo guia de usuário "${transacao}" com a sua descrição "@{descricao}" 
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em Guia de usuário
    Então a seção é salva e o cadastro do campo Guia de usuário é encerrado



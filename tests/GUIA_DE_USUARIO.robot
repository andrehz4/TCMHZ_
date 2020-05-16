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
    andre.zimermann@ul.com       Rede@123                          Rascunho
    

GUIA DE USUÁRIO sem applicabilities
    [Template]      Cadastro do campo GUIA DE USUÁRIO sem applicabilities
    #CT             			#Transação      				#Descrição     	
	TESTEHZ                     venda                   		Transação foi aprovada	 	
    TESTEHZ                     venda        				    Transação foi rejeitada 
	    
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
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Guia de usuário
    Quando é preenchido o campo guia de usuário "${transacao}" com a sua descrição "${descricao}"
    Então a seção é salva e o cadastro do campo Guia de usuário é encerrado

Cadastro do campo GUIA DE USUÁRIO com applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}   ${localizador}   ${valor}  ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Guia de usuário
    Quando é preenchido o campo guia de usuário "${transacao}" com a sua descrição "@{descricao}" 
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em Guia de usuário
    Então a seção é salva e o cadastro do campo Guia de usuário é encerrado



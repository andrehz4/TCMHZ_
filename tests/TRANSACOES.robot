*** Settings ***
Documentation       TCM - CAMPO TRANSAÇÕES
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo transações com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Transações
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

TRANSAÇÕES sem applicabilities
    [Template]      Cadastro do campo TRANSAÇÕES sem applicabilities
    #CT             			#Transação      	#Localizador Img Cartão    					#0-Magnetic Stripe,1-Contact Chip,2-Contactless Chip,3-Keyed,4-Manual,5-No Keyed,6-None,7-QR Code 
    TESTEHZ         venda           1   2   

    
TRANSAÇÕES com applicabilities
    [Template]      Cadastro do campo TRANSAÇÕES com applicabilities
    #CT             #Transação      #Localizador Img Cartão     #0-Magnetic Stripe      #Applicabilities
    
                    

*** Keywords ***
Tentar logar na RSTP Transações
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo TRANSAÇÕES sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacoes}  ${localizador}   ${valor}  
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "Transações"
    Quando é preenchido o campo transacoes "${transacoes}", o localizador ${localizador} e o valor ${valor}
    Então a seção é salva e o cadastro do campo transações é encerrado
    
Cadastro do campo TRANSAÇÕES com applicabilities
    [Arguments]     ${caso_de_teste}    ${transacoes}   ${localizador}   ${valor}  ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "Transações"
    Quando é preenchido o campo transacoes "${transacoes}", o localizador ${localizador} e o valor ${valor}
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em transações
    Então a seção é salva e o cadastro do campo transações é encerrado



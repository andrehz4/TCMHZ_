*** Settings ***
Documentation       TCM - CAMPO VALIDAÇÕES DE HOST
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo validações de host com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Validações de Host
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

VALIDAÇÕES DE HOST sem applicabilities
    [Template]      Cadastro do campo VALIDAÇÕES DE HOST sem applicabilities
    #CT                     #Transação      #Propriedade    #0-igual a,1-diferente de,2-maior que,3-maior que ou igual a,4-menor que,5-menor que ou igual a,6-contém         #Valor Esperado        #Formato        #Descrição
    ESTATISTICA-CH-HF-001   Venda12         REQUEST.MTI     0   0200       EBCDIC       MTI está presente e é igual a '0200'
        

*** Keywords ***
Tentar logar na RSTP Validações de host
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo VALIDAÇÕES DE HOST sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}  ${propriedade}   ${operador}  ${valor_esperado}   ${formato}  ${descricao}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Host
    Quando é preenchido o campo validações de host "${transacao}", a propriedade ${propriedade}, o operador ${operador}, o valor esperado ${valor_esperado}, o formato ${formato} e com a descrição ${descricao}     
    Então a seção é salva e o cadastro do campo validações de host é encerrado
    



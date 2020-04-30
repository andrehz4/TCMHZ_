*** Settings ***
Documentation       TCM - CAMPO VALIDAÇÃO DOS REGISTROS DO CARTÃO
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo validação dos registros do cartão com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP Validação dos registros do cartão
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

VALIDAÇÃO DOS REGISTROS DO CARTÃO sem applicabilities
    [Template]      Cadastro do campo VALIDAÇÃO DOS REGISTROS DO CARTÃO sem applicabilities
    #CT                         #Transação      #Propriedade    #0-igual a,1-diferente de,2-maior que,3-maior que ou igual a,4-menor que,5-menor que ou igual a,6-contém         #Valor Esperado        #Formato        #Descrição
    ESTATISTICA-CH-HF-001       Venda12         

*** Keywords ***
Tentar logar na RSTP Validação dos registros do cartão
    [Arguments]     ${email}    ${password}    ${expect_message}
    
    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo VALIDAÇÃO DOS REGISTROS DO CARTÃO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${transacao}  ${propriedade}   ${operador}  ${valor_esperado}   ${formato}  ${descricao}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar validação dos registros do cartão
    Quando é preenchido o campo validação dos registros do cartão "${transacao}", a propriedade ${propriedade}, o operador ${operador}, o valor esperado ${valor_esperado}, o formato ${formato} e com a descrição ${descricao}     
    Então a seção é salva e o cadastro do campo validação dos registros do cartão é encerrado
    



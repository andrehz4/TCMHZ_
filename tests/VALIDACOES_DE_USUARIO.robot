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
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

VALIDAÇÕES DE USUÁRIO sem applicabilities
    [Template]      Cadastro do campo VALIDAÇÕES DE USUÁRIO sem applicabilities
    #CT             #Transação      #Valor esperado     #Descrição
	AMEX CHIP - AXP EMV 001		Venda			Yes		O terminal lê a tarja magnética e solicita a inserção do chip			
	AMEX CHIP - AXP EMV 002		Venda			Yes		O valor da transação é exibido ao cliente			
    AMEX CHIP - AXP EMV 004		Venda			Yes		Terminal não exibe Application Label - OU - exibe AMERICAN EXPRESS na tela			
	AMEX CHIP - AXP EMV 006		Venda			Yes		Transação é aprovada online			
	AMEX CHIP - AXP EMV 008		Venda			Yes		Transação prossegue quando a senha é ignorada (PIN Bypass)			
	AMEX CHIP - AXP EMV 017 2		Venda			Yes		Terminal solicita inserção de chip			
	AMEX CHIP - AXP EMV 017 2		Venda			Yes		Terminal solicita tarja magnética			
	AMEX CHIP - AXP EMV 017 2		Venda			Yes		O valor da transação é exibido ao cliente			
	AMEX CHIP - AXP EMV 017 2		Venda			Yes		Transação é negada online			
	AMEX CHIP - AXP EMV 032		Venda			Yes		O terminal solicita a senha			
	AMEX CHIP - AXP EMV 032		Venda			No		É exibido linha de assinatura no comprovante			
	AMEX CHIP - AXP EMV 033		Trx2 Senha Incorreta			Yes		O terminal solicita a senha			
	AMEX CHIP - AXP EMV 033		Trx2 Senha Incorreta			Yes		O terminal exibe a mensagem Senha Inválida ou mensagem similar			
	AMEX CHIP - AXP EMV 033		Trx3 Senha correta			Yes		O terminal solicita a senha			
	AMEX CHIP - AXP EMV 033		Trx3 Senha correta			Yes		Transação é aprovada online			
    AMEX CHIP - AXP EMV 037		Venda			Yes		Transação prossegue quando a senha é ignorada (PIN Bypass)					
	AMEX MAG - AXP MAG 002		Venda			Yes		O valor da transação é exibido ao cliente			
	AMEX MAG - AXP MAG 002		Venda			Yes		No comprovante é impresso linha de assinatura ou assinatura capturada eletronicamente			
	AMEX CHIP - AXP RCP 001		Venda			Yes		O valor da transação é impresso no comprovante			
	AMEX CHIP - AXP RCP 001		Venda			Yes		Número do comerciante e / ou nome e endereço do comerciante estão impressos no comprovante			
    AMEX CTLS - AXP EP023		Venda			Yes		O terminal exibe a mensagem Aprovado ou mensagem similar			
	AMEX CTLS - AXP EP090		Venda			Yes		O terminal exibe a mensagem Apresente o cartão ou mensagem similar			
	          

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
    



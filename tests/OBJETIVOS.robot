*** Settings ***
Documentation       TCM - CAMPO OBJETIVOS
...                 Para que eu possa inserir dados na página de cadastro de cts no TCM
...                 Sendo um usuário que possui um email e senha com privilégio de administrador
...                 Quero poder finalizar o cadastro completo com suas applicabilities do campo objetivos com sucesso
...                 E encerrar a seção.

Resource         ../resources/setup_hz.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
Administrador loga com email e senha válido!
    [Template]                  Tentar logar na RSTP
    rafael.ribeiro@ul.com       Safra@123                          Rascunho
    

TRANSAÇÕES sem applicabilities
    [Template]      Cadastro do campo OBJETIVO sem applicabilities
    #CT            #Objetivo                                      
	AMEX CHIP - AXP EMV 027		Seleção de múltiplas aplicações: Garantir que o terminal possa processar corretamente a seleção do titular do cartão e solicita a confirmação do titular do cartão, utilizando um cartão com múltiplas aplicações.
	AMEX CHIP - AXP EMV 028		Aprovação Chip Downgraded Mode: Garantir que o terminal realize uma transação de venda de chip online em 'downgraded mode' e aprove a transação.
	AMEX CHIP - AXP EMV 029		Negado Chip Downgraded Mode: Garantir que o terminal realize uma transação de venda de chip online em 'downgraded mode' e nega a transação.
	AMEX CHIP - AXP EMV 030		NO CVM Obrigatório: Garantir que o terminal possa executar uma transação NO CVM.
	AMEX CHIP - AXP EMV 032		Online PIN, senha bem sucedida: Garantir que o terminal aprove uma transação usando o CVM Online PIN.
	AMEX CHIP - AXP EMV 033		Online PIN, senha incorreta: Garantir que o terminal processe uma resposta de PIN incorreta e exiba a mensagem apropriada.
	AMEX CHIP - AXP EMV 035		Online PIN, limite de tentativa de PIN excedido: Garantir que o terminal processe corretamente quando o limite de tentativa do PIN excedeu e recusa a transação.
	AMEX CHIP - AXP EMV 037		Online PIN, Bypass: Garantir que o terminal possa ignorar corretamente o PIN quando o PIN online é desconhecido pelo titular do cartão.
	AMEX CHIP - AXP EMV 039		Online PIN, negado: Garantir que o terminal nega uma transação usando o CVM Online PIN.
	AMEX MAG - AXP MAG 001		Trilha ANSI: Garantir que o terminal leia a tarja magnética do cartão no formato ANSI e realize uma transação online.
	AMEX MAG - AXP MAG 002		Trilha ISO: Garantir que o terminal leia a tarja magnética do cartão no formato ISO e realize uma transação online.
	AMEX CHIP - AXP RCP 001		Comprovante: Garantir que o terminal imprime um comprovante que inclui todas as informações obrigatórias de acordo com a Implementação da aceitação de American Express EMV em um terminal e os requisitos regionais.
	AMEX CTLS - AXP EP001		Aprovação Offline e recibo impresso: Garantir que o terminal aprove uma transação sem contato offline e imprima um recibo, se solicitado.
	AMEX CTLS - AXP EP002		Aprovação Offline, teste de desempenho de aprovação offline: Garantir que o terminal aprove uma transação sem contato offline e conclua a transação em 500ms ou menos.
	AMEX CTLS - AXP EP003		Aprovação do modo EMV - Contactless floor limit excedido se a assinatura for suportada: Garantir que o terminal aprove uma transação online sem contato, uma vez que o contactless floor limit tenha sido excedido.
	AMEX CTLS - AXP EP004		Apresentação de vários cartões: Garantir que o terminal solicite ao usuário Apresentar apenas um cartão se vários cartões forem apresentados.
	AMEX CTLS - AXP EP005		Transação no limite de transação sem contato - processa como transação contactless: Garantir que a transação possa ser processada pela interface sem contato quando o valor da transação for igual ao limite da transação sem contato. Para os fins deste teste, o resultado desejado é ver o terminal ativar a interface sem contato, qualquer coisa além disso está fora do escopo.
	AMEX CTLS - AXP EP006		Contactless Transaction Limit excedido - o terminal não processará a transação como sem contato: Garantir que, quando uma transação exceder o limite de transação sem contato, a interface sem contato não seja ativada.
	AMEX CTLS - AXP EP007		Modo EMV - Aprovação offline - Suporte para CAPK 1984 obrigatório e preferência de idioma: Garantir que o terminal aprove uma transação offline sem contato. O suporte para preferências de idioma é opcional (francês). Se não houver suporte, indique-o usando a seção comentários.
	AMEX CTLS - AXP EP008		Aprovação online do modo magnético: Garantir que o terminal aprove uma transação online no modo magnético.
	AMEX CTLS - AXP EP010		Modo magnético - negado online: Garantir que o terminal recuse uma transação online no modo magnético.
	AMEX CTLS - AXP EP011		Modo magnético - negado - Unable to go Online: Garantir que, no caso de um terminal sendo unable to go online, a transação será recusada offline.
	AMEX CTLS - AXP EP013		Modo magnético - Aprovação online - Expresspay 1 Card - Teste de compatibilidade: Garantir que o terminal aprove uma transação online no modo magnético, quando o cartão estiver configurado como um cartão Expresspay 1.
	AMEX CTLS - AXP EP014		Modo EMV - Aprovação online - Limites de cartão offline excedidos: Garantir que o terminal aprove uma transação sem contato online quando os limites offline de um cartão forem excedidos.
	AMEX CTLS - AXP EP015		Modo EMV - Aprovação online - ‘01’ PAN Sequence Number: Garantir que o terminal aprove uma transação sem contato online quando o cartão tiver '01 PAN Sequence number'. O cartão vai enviar a transação online devido aos zeros dos contadores offline.
	AMEX CTLS - AXP EP016		Modo EMV - Negado - Falha CDA (depois do Gen AC): Garantir que o terminal recusa a transação quando o CDA falha e a recuperação da chave for depois do GAC.
	AMEX CTLS - AXP EP017		Modo EMV - Aprovação online - O valor da transação excede o limite mínimo - PIN online solicitado: Garantir que o terminal aprove uma transação online sem contato usando o PIN online, quando suportado.
	AMEX CTLS - AXP EP018		Modo EMV Aplicação Mobile - Aprovação online - CVM Mobile realizado com sucesso: Um cartão de teste é carregado com uma aplicação de pagamento móvel. O valor da transação excede os limites mínimos exigidos e sem contato da CVM do terminal. O aplicativo simula uma transação em que o portador do cartão executou com sucesso o CVM mobile (Passcode). O terminal envia a transação online para autorização e processa a resposta de aprovação do emissor.
	AMEX CTLS - AXP EP019		Modo magnético Aplicação Mobile - CVM Mobile realizado com sucesso: Um cartão de teste é carregado com uma aplicação de pagamento móvel. O aplicativo simula uma transação em que o portador do cartão executou com sucesso o CVM mobile (Passcode). O terminal envia a transação online para autorização e processa a resposta de aprovação do emissor.
	AMEX CTLS - AXP EP020		Modo magnético Aplicação Mobile - CVM Mobile não foi inserido e falhou: Um cartão de teste é carregado com uma aplicação de pagamento móvel. O aplicativo simula uma transação em que o titular do cartão não realizou a verificação do titular do cartão. O limite exigido pela CVM foi excedido. O terminal solicita ao titular do cartão que procure instruções no telefone. O titular do cartão falha ao inserir corretamente sua senha. O terminal envia a transação online para autorização e processa a resposta de recusa do emissor.
	AMEX CTLS - AXP EP021		Modo EMV - CVM Required Limit excedido - Verificação do titular do cartão não suportada pelo cartão - Tente outra interface: Garantir que, quando apresentado a um cartão que não suporta a verificação do titular do cartão durante uma transação em que o 'CVM Required Limit' tenha sido excedido, mas o valor esteja abaixo do limite da transação, será feita uma solicitação para usar outra interface.
	AMEX CTLS - AXP EP023		Modo EMV - CVM Required Limit excedido - A verificação do titular do cartão não é suportada pelo cartão, a interface do chip de contato não é suportada pelo cartão: Garantir que o terminal aprove uma transação online quando o cartão não contém uma configuração de capacidade de interface alternativa e o 'CVM Required Limit' foi excedido.
	AMEX CTLS - AXP EP084		Modo EMV - Online PIN - O valor da transação excede o limite mínimo - PIN online incorreto inserido: Garantir que o terminal processe uma resposta de PIN incorreta e exiba a mensagem apropriada.
	AMEX CTLS - AXP EP085		Modo EMV - Online PIN - O valor da transação excede o limite mínimo - Limite de tentativa de PIN online excedido: Garantir que o terminal processe um 'PIN try limit' excedido e recuse a transação.
	AMEX CTLS - AXP EP088		Modo EMV - Negado Online - O valor da transação excede o limite mínimo - PIN online solicitado: Garantir que o terminal recuse uma transação online sem contato usando o PIN online, quando suportado.
	AMEX CTLS - AXP EP090		Modo EMV - Aprovação online - Indicador HCE no terminal com capacidade online: Garantir que a presença do indicador HCE não afete a transação em um terminal com capacidade online.
	AMEX CTLS - AXP EP091		Modo EMV - Aprovação online - Offline Card Limits excedido e SDA selecionado: Garantir que o terminal aprove uma transação sem contato online quando o cartão tiver um '01 PAN Sequence number'. O cartão ficará online devido aos contadores offline estarem definidos como zero, o SDA selecionado é sinalizado no TVR.
	AMEX CTLS - AXP EP092		Modo EMV - Aprovação online - Membership Data, ASRPD, PAR, TRID, 4 últimos dígitos do PAN: Garantir que a presença de dados relacionados à Membership Data, ASRPD, PAR, TRID e 4 últimos dígitos do PAN não afete o processamento de transações em um terminal com capacidade Online.
	AMEX CTLS - AXP EP094		Modo EMV - Contactless não permitido - Dynamic Limit Set 6 suportado: Garantir que o 'Dynamic Limit Set' definido pelo emissor e com suporte do terminal substitua os limites dinâmicos padrão pelo conjunto 6 e não permita uma transação sem contato.
	AMEX CTLS - AXP EP095		Modo EMV - Aprovação online - Dynamic Limit Set 11 suportado: Garantir que o 'Dynamic Limit Set' definido pelo emissor e com suporte do terminal substitua os limites dinâmicos padrão pelo conjunto 11 e uma transação sem contato seja aprovada online.
	AMEX CTLS - AXP EP097		Modo EMV - Aprovação online - Dynamic Limit Set 11 Interoperabilidade: Garantir que o 'Dynamic Limit Set' não afete o processamento de transações em um terminal com capacidade Online.
	AMEX CTLS - AXP EP099		Terminal retorna 'Enhanced Contactless Reader Capabilities' (Tag 9F6E): Garantir que o terminal retorne o Tag 9F6E quando o PDOL solicitar.	


TRANSAÇÕES com applicabilities
    [Template]      Cadastro do campo OBJETIVO com applicabilities
    #CT             #Objetivo                                      #Applicabilities
                                                           

*** Keywords ***
Tentar logar na RSTP
    [Arguments]     ${email}    ${password}    ${expect_message}

    Dado que acesso a página login da RSTP
    Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"

Cadastro do campo OBJETIVO sem applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivos}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivos}" 
    Então a seção é salva e o cadastro do campo objetivos é encerrado
    
Cadastro do campo OBJETIVO com applicabilities
    [Arguments]     ${caso_de_teste}    ${objetivo}     ${applicabilitie}    
    
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Quando é preenchido o campo objetivo "${objetivo}"
    E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em objetivos
    Então a seção é salva e o cadastro do campo objetivos é encerrado 


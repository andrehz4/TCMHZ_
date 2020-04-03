*** Settings ***
Resource    base.robot

*** Variables ***
${caso_de_teste}
${applicabilitie}
${campo_de_atuacao}

*** Keywords ***
###################### Login
Dado que acesso a página login da RSTP
    Go To       ${BASE_URL}

Quando eu submeto minha credencial de login "${email}" e senha "${password}"
    Input Text                              ${INPUT_EMAIL}                                  ${email}
    Input Text                              ${INPUT_PASSWORD}                               ${password}
    Click Element                           ${BUTTON_LOGIN} 

Então devo ir para a página de cadastro do TCM no modo rascunho "${expect_message}"
    Element Text Should Be                  ${TEXTO_ESTA_PRESENTE}                          ${expect_message}
    ${WebElement}=                          Get WebElement	                                ${TEXTO_ESTA_PRESENTE}
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20


###################### Objetivos
Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    Click Element                           ${SPAN_OBJETIVO}
    
   
Quando é preenchido o campo objetivo "${objetivo}"
    Wait Until Element Is Visible           ${NAME_DESCRICION}                              20
    Clear Element Text                      ${NAME_DESCRICION} 
    Sleep                                   1
    Input Text                              ${NAME_DESCRICION}                              ${objetivo}

Então a seção é salva e o cadastro do campo objetivos é encerrado
    Capture Page Screenshot                 
    Wait Until Element Is Enabled           ${BUTTON_OK_OBJETIVOS} 
    Click Element                           ${BUTTON_OK_OBJETIVOS} 
    Wait Until Element Is Enabled           ${BUTTON_SALVAR_DROPDOWN}                       20
    Click Element                           ${BUTTON_SALVAR_DROPDOWN}  
    Wait Until Element Is Visible           ${LINKTEXT_CRIAR_NOVA_VERSAO}                   5
    Click Link                              ${LINKTEXT_CRIAR_NOVA_VERSAO}
    Sleep                                   5

E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em objetivos
    Wait Until Element Is Enabled           ${BUTTON_ADICIONAR_GRUPO_OBJETIVOS}
    Click Element                           ${BUTTON_ADICIONAR_GRUPO_OBJETIVOS}
    Wait Until Element Is Visible           ${INPUT_NAME_APPLICABILITY_RED}   
    Press Keys	                            ${INPUT_NAME_APPLICABILITY_RED}                  BACKSPACE  BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE  
    Input Text                              ${INPUT_NAME_APPLICABILITY_RED}                  ${applicabilitie}
    Wait Until Element Is Visible           //strong[contains(text(),'${applicabilitie}')]  
    Click Element                           //strong[contains(text(),'${applicabilitie}')]              


###################### Transações
Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "${campo_de_atuacao}"
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    Click Element                           //crfo-panel[@title='${campo_de_atuacao}']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
    
Quando é preenchido o campo transacoes "${transacoes}", o localizador ${localizador} e o valor ${valor}
    Set Focus To Element                    ${BUTTON_ADICIONAR_TRANSACAO}
    Sleep                                   1
    Wait Until Element Is Visible           ${BUTTON_ADICIONAR_TRANSACAO}                   20
    Click Element                           ${BUTTON_ADICIONAR_TRANSACAO}
    Wait Until Element Is Visible           ${SELECT_INTERFACE)}
    Select From List By Value               ${SELECT_INTERFACE)}                            ${valor}
    Input Text                              ${INPUT_LOCALIZACAO_IMAGEM_CARTAO)}             ${localizador}
    Input Text                              ${TD_CAMPO_TRANSACAO}                           ${transacoes}

Então a seção é salva e o cadastro do campo transações é encerrado                
    Click Element                           ${BUTTON_OK_TRANSACOES} 
    Capture Page Screenshot                 
    Wait Until Element Is Enabled           ${BUTTON_SALVAR_DROPDOWN}                       20
    Click Element                           ${BUTTON_SALVAR_DROPDOWN}  
    Wait Until Element Is Visible           ${LINKTEXT_CRIAR_NOVA_VERSAO}                   5
    Click Link                              ${LINKTEXT_CRIAR_NOVA_VERSAO}
    Sleep                                   5

E eu inicio o botão de adicionar applicabilities "${applicabilitie}" em transações
    Wait Until Element Is Enabled           ${BUTTON_ADICIONAR_GRUPO_TRANSAÇOES}
    Click Element                           ${BUTTON_ADICIONAR_GRUPO_TRANSAÇOES}
    Sleep       1
    Wait Until Element Is Visible           ${INPUT_NAME_APPLICABILITY_RED}   
    Press Keys	                            ${INPUT_NAME_APPLICABILITY_RED}                  BACKSPACE  BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE  
    Input Text                              ${INPUT_NAME_APPLICABILITY_RED}                  ${applicabilitie}
    Wait Until Element Is Visible           //strong[contains(text(),'${applicabilitie}')]  
    Click Element                           //strong[contains(text(),'${applicabilitie}')]              







Quando eu faço o anúncio dessa bike
    ### E agora o que eu faço?
    ### Dica: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    Choose File     ${INPUT_THUMB}            ${CURDIR}/images/${bike_json['thumb']}

    Clear Element Text      ${INPUT_NAME} 
    Input Text              ${INPUT_NAME}      ${bike_json['name']}
    Clear Element Text      ${INPUT_BRAND} 
    Input Text              ${INPUT_BRAND}     ${bike_json['brand']}

    Input Text      ${INPUT_PRICE}     ${bike_json['price']}
    Click Element   ${BUTTON_SUBMIT}

Então devo ver minha bike na lista de anúncios
    Wait Until Element Is Visible   ${BIKE_ITEM}
    Element Should Contain          ${BIKE_LIST}     ${bike_json['name']}

E o valor para locação deve ser igual a "${expect_price}"
    Element Should Contain      ${BIKE_LIST}     ${expect_price}

Então devo ver uma mensagem de erro "${expect_message}"
    Element Text Should Be     ${ALERT_ERROR}     ${expect_message}
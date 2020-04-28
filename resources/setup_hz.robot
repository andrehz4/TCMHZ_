*** Settings ***
Resource    base.robot

*** Variables ***
${caso_de_teste}
${applicabilitie}
${campo_de_atuacao}
${null} 

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
    
   
Quando é preenchido o campo objetivo "${objetivos}"
    Sleep                                   10
    Wait Until Element Is Visible           ${NAME_DESCRICION}                              20
    Clear Element Text                      ${NAME_DESCRICION} 
    Sleep                                   3
    Input Text                              ${NAME_DESCRICION}                              ${objetivos}

Então a seção é salva e o cadastro do campo objetivos é encerrado
    Sleep                                   4
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
    Sleep                                   2
    Wait Until Element Is Visible           //strong[contains(text(),'${applicabilitie}')]  
    Sleep                                   2
    Click Element                           //strong[contains(text(),'${applicabilitie}')]       
    Sleep                                   2      


###################### Transações
Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "${campo_de_atuacao}"
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    Click Element                           //crfo-panel[@title='${campo_de_atuacao}']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
    
Quando é preenchido o campo transacoes "${transacoes}", o localizador ${localizador} e o valor ${valor}
    Sleep                                   3
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
    Wait Until Element Is Visible           ${INPUT_APPLICABILITY_RED_TRANSACOES}   
    Press Keys	                            ${INPUT_APPLICABILITY_RED_TRANSACOES}            BACKSPACE  BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE   BACKSPACE  
    Input Text                              ${INPUT_APPLICABILITY_RED_TRANSACOES}            ${applicabilitie}
    Wait Until Element Is Visible           //strong[contains(text(),'${applicabilitie}')]  
    Click Element                           //strong[contains(text(),'${applicabilitie}')]              


######################  Guia de usuário
    Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar "${campo_de_atuacao}"
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Set Focus To Element                    ${SPAN_GUIA_DE_USUARIO} 
    Sleep                                   2
    Wait Until Element Is Visible           ${SPAN_GUIA_DE_USUARIO}  
    Click Element                           ${SPAN_GUIA_DE_USUARIO}  
    
Quando é preenchido o campo guia de usuário "${transacao}" com a sua descrição "${descricao}"
    Sleep                                   5
    Wait Until Element Is Visible           //h4[@id='editTcUserguideLabel']//..//..//td[contains(text(),'${transacao}')]/..//a             20
    Set Focus To Element                    //h4[@id='editTcUserguideLabel']//..//..//td[contains(text(),'${transacao}')]/..//a
    Sleep                                   3
    Click Element                           //h4[@id='editTcUserguideLabel']//..//..//td[contains(text(),'${transacao}')]/..//a
    Wait Until Element Is Visible           ${INPUT_DESCRICAO_GUIA_DE_USUARIO}   
    Input Text                              ${INPUT_DESCRICAO_GUIA_DE_USUARIO}               ${descricao} 
    Log                                     ${descricao} 
    Capture Page Screenshot

Então a seção é salva e o cadastro do campo Guia de usuário é encerrado               
    Wait Until Element Is Enabled           ${BUTTON_OK_GUIA_DE_USUARIO} 
    Click Element                           ${BUTTON_OK_GUIA_DE_USUARIO} 
    Capture Page Screenshot  	                                        
    Sleep                                   2  
    Set Focus To Element                    ${A_PAGINA_INICIAL} 
    Sleep                                   2  
    Wait Until Element Is Enabled           ${BUTTON_SALVAR_DROPDOWN}                       20
    Click Element                           ${BUTTON_SALVAR_DROPDOWN}  
    Wait Until Element Is Visible           ${LINKTEXT_CRIAR_NOVA_VERSAO}                   5
    Click Link                              ${LINKTEXT_CRIAR_NOVA_VERSAO}
    Sleep                                   5             

######################  Validações de host
Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Host
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Sleep                                   2
    Wait Until Element Is Visible           ${SPAN_ESCRITO_VALIDACOES_DE_HOST}              20
    Set Focus To Element                    ${SPAN_ESCRITO_VALIDACOES_DE_HOST} 
    Sleep                                   2
    Click Element                           //crfo-panel[@title='Validações de Host']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
            
Quando é preenchido o campo validações de host "${transacao}", a propriedade ${propriedade}, o operador ${operador}, o valor esperado ${valor_esperado}, o formato ${formato} e com a descrição ${descricao}     
    Wait Until Element Is Visible           //div[@id='editTcHostvalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Set Focus To Element                    //div[@id='editTcHostvalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Sleep                                   2
    Click Element                           //div[@id='editTcHostvalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Wait Until Element Is Visible           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Click Element                           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Click Element                           ${BUTTON_VALIDACOES_DE_HOST_PROPRIEDADE_LISTA} 
    Wait Until Element Is Visible           ${INPUT_VALIDACOES_DE_HOST_PROPRIEDADE_TEXTO}
    Input Text                              ${INPUT_VALIDACOES_DE_HOST_PROPRIEDADE_TEXTO}   ${propriedade}
    Select From List By Index               ${SELECT_VALIDACOES_DE_HOST_OPERADOR}           ${operador}
    Input Text                              ${INPUT_VALIDACOES_DE_HOST_VALOR_ESPERADO}      ${valor_esperado}
    #Click Element                           ${BUTTON_VALIDACOES_DE_HOST_ASCII}
    #Wait Until Element Is Visible           ${SELECT_VALIDACOES_DE_HOST_PERFIL}
    #Click Element                           //span[contains(text(),'N/A')]//..//..//..//button[contains(text(),'ASCII ')]//..//li//a[contains(text(),'${formato}')]
    Select From List By Label               ${SELECT_VALIDACOES_DE_HOST_PASS}                Pass   
    Select From List By Label               ${SELECT_VALIDACOES_DE_HOST_FAIL}                Fail    
    Input Text                              ${TEXTAREA_VALIDACOES_DE_HOST_DESCRICAO}         ${descricao}
    Capture Page Screenshot
     Sleep                                  5

Então a seção é salva e o cadastro do campo validações de host é encerrado             
    Wait Until Element Is Enabled           ${BUTTON_OK_VALIDACOES_DE_HOST} 
    Click Element                           ${BUTTON_OK_VALIDACOES_DE_HOST} 
    Capture Page Screenshot  	                                        
    Sleep                                   2  
    Set Focus To Element                    ${A_PAGINA_INICIAL} 
    Sleep                                   2  
    Wait Until Element Is Enabled           ${BUTTON_SALVAR_DROPDOWN}                       20
    Click Element                           ${BUTTON_SALVAR_DROPDOWN}  
    Wait Until Element Is Visible           ${LINKTEXT_CRIAR_NOVA_VERSAO}                   5
    Click Link                              ${LINKTEXT_CRIAR_NOVA_VERSAO}
    Sleep                                   10             




######################  Validações de Usuário
Dado que acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Usuário
    Go To                                   about:blank
    Go To                                   ${BASE_URL}#!/${caso_de_teste}
    Sleep                                   2
    Wait Until Element Is Visible           ${SPAN_ESCRITO_VALIDACOES_DE_USUARIO}            20
    Set Focus To Element                    ${SPAN_ESCRITO_VALIDACOES_DE_USUARIO} 
    Sleep                                   2
    Click Element                           ${SPAN_ESCRITO_VALIDACOES_DE_USUARIO}

Quando é preenchido o campo validações de Usuário "${transacao}", o valor esperado ${valor_esperado} e com a descrição ${descricao}     
    Wait Until Element Is Visible           //div[@id='editTcUservalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Set Focus To Element                    //div[@id='editTcUservalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Sleep                                   2
    Click Element                           //div[@id='editTcUservalidations']//h4[@class='ng-binding'][contains(text(),'${transacao}')]/..//a[contains(text(),'Adicionar')]
    Wait Until Element Is Visible           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Click Element                           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Wait Until Element Is Visible           ${INPUT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}
    Input Text                              ${INPUT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}    Yes
    Click Element                           ${SPAN_VALIDACOES_DE_USUARIO_ADICIONAR}
    Input Text                              ${INPUT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}    No
    Click Element                           ${SPAN_VALIDACOES_DE_USUARIO_ADICIONAR}
    Select From List By Label               ${SELECT_VALIDACOES_DE_USUARIO_PASS}             Pass   
    Select From List By Label               ${SELECT_VALIDACOES_DE_USUARIO_FAIL}             Fail    
    Select From List By Label               ${SELECT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}   ${valor_esperado}
    Input Text                              ${TEXTAREA_VALIDACOES_DE_USUARIO_DESCRICAO}      ${descricao}
    Capture Page Screenshot
     Sleep                                  5

Então a seção é salva e o cadastro do campo validações de Usuário é encerrado
    Wait Until Element Is Enabled           ${BUTTON_OK_VALIDACOES_DE_USUARIO} 
    Click Element                           ${BUTTON_OK_VALIDACOES_DE_USUARIO} 
    Capture Page Screenshot  	                                        
    Sleep                                   2  
    Set Focus To Element                    ${A_PAGINA_INICIAL} 
    Sleep                                   2  
    Wait Until Element Is Enabled           ${BUTTON_SALVAR_DROPDOWN}                       20
    Click Element                           ${BUTTON_SALVAR_DROPDOWN}  
    Wait Until Element Is Visible           ${LINKTEXT_CRIAR_NOVA_VERSAO}                   5
    Click Link                              ${LINKTEXT_CRIAR_NOVA_VERSAO}
    Sleep                                   10  

























######################  Criação de Cts
Dado que crio e acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Criação de Cts
    Go To                                   about:blank
    Go To                                   ${BASE_URL}
    Sleep                                   2
    Wait Until Element Is Visible           ${SPAN_CRIACAO_DE_CTS_ADICIONAR}                20
    Set Focus To Element                    ${SPAN_CRIACAO_DE_CTS_ADICIONAR}
    Sleep                                   2
    Click Element                           ${SPAN_CRIACAO_DE_CTS_ADICIONAR}

Quando é criado e preenchido o campo Criação de Cts "${caso_de_teste}" e clico no botão OK  
    Wait Until Element Is Visible           ${H4_CRIACAO_DE_CTS_LABEL_ADICIONAR}
    Set Focus To Element                    ${H4_CRIACAO_DE_CTS_LABEL_ADICIONAR}
    Wait Until Element Is Visible           ${INPUT_CRIACAO_DE_CTS_NOME_TESTE_CASE}
    Clear Element Text                      ${INPUT_CRIACAO_DE_CTS_NOME_TESTE_CASE} 
    Sleep                                   1
    Input Text                              ${INPUT_CRIACAO_DE_CTS_NOME_TESTE_CASE}         ${caso_de_teste}
    Sleep                                   3
    Click Element                           ${BUTTOM_CRIACAO_DE_CTS_SALVAR_OK}
    Capture Page Screenshot

Dado crio um caso de teste "${caso_de_teste}" e clico no botão de editar
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    Click Element                           ${SPAN_OBJETIVO}
    Wait Until Element Is Visible           ${NAME_DESCRICION}                              20
    Clear Element Text                      ${NAME_DESCRICION} 
    Sleep                                   1
    Input Text                              ${NAME_DESCRICION}                              Objetivo
    Capture Page Screenshot                 
    Wait Until Element Is Enabled           ${BUTTON_OK_OBJETIVOS} 
    Click Element                           ${BUTTON_OK_OBJETIVOS} 

Dado crio e acesso o caso de teste "${caso_de_teste}" e clico no botão de editar
    Wait Until Element Is Visible           ${TEXTO_GUIA_DE_USUARIO_PRESENTE}               20
    Click Element                           ${SPAN_TRANSACOES}
    Set Focus To Element                    ${BUTTON_ADICIONAR_TRANSACAO}
    Sleep                                   3
    Wait Until Element Is Visible           ${BUTTON_ADICIONAR_TRANSACAO}                   20
    Click Element                           ${BUTTON_ADICIONAR_TRANSACAO}
    Wait Until Element Is Visible           ${SELECT_INTERFACE)}
    Select From List By Value               ${SELECT_INTERFACE)}                            1
    Input Text                              ${INPUT_LOCALIZACAO_IMAGEM_CARTAO)}             transacao
    Input Text                              ${TD_CAMPO_TRANSACAO}                           transacoes   
    Click Element                           ${BUTTON_OK_TRANSACOES} 
    Capture Page Screenshot          

Dado crio e acesso o caso de teste "${caso_de_teste}" e clico no botão de editar Validações de Host
    Wait Until Element Is Visible           ${SPAN_ESCRITO_VALIDACOES_DE_HOST}              20
    Set Focus To Element                    ${SPAN_ESCRITO_VALIDACOES_DE_HOST} 
    Sleep                                   2
    Click Element                           ${SPAN_VALIDACOES_DE_HOST}   
    Wait Until Element Is Visible           ${SPAN_VALIDACOES_DE_HOST_TRANSACOES}
    Set Focus To Element                    ${SPAN_VALIDACOES_DE_HOST_TRANSACOES}
    Sleep                                   2
    Click Element                           ${SPAN_VALIDACOES_DE_HOST_TRANSACOES}
    Wait Until Element Is Visible           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Click Element                           ${SPAN_VALIDACOES_DE_HOST_N/A}
    Click Element                           ${BUTTON_VALIDACOES_DE_HOST_PROPRIEDADE_LISTA} 
    Wait Until Element Is Visible           ${INPUT_VALIDACOES_DE_HOST_PROPRIEDADE_TEXTO}
    Input Text                              ${INPUT_VALIDACOES_DE_HOST_PROPRIEDADE_TEXTO}    Propriedade
    Select From List By Index               ${SELECT_VALIDACOES_DE_HOST_OPERADOR}            1
    Input Text                              ${INPUT_VALIDACOES_DE_HOST_VALOR_ESPERADO}       1
    Select From List By Label               ${SELECT_VALIDACOES_DE_HOST_PASS}                Pass   
    Select From List By Label               ${SELECT_VALIDACOES_DE_HOST_FAIL}                Fail    
    Input Text                              ${TEXTAREA_VALIDACOES_DE_HOST_DESCRICAO}         Descrição
    Capture Page Screenshot                          
    Sleep                                   5  
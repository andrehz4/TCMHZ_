*** Settings ***

Resource         ../resources/setup_hz.robot
# representação do padrão page object para Robot Framework

*** Variables ***
### login page
${INPUT_EMAIL}                                  id:email
${INPUT_PASSWORD}                               id:password
${BUTTON_LOGIN}                                 id:loginButton
${TEXTO_ESTA_PRESENTE}                          //span[contains(text(),'Rascunho')]
${TEXTO_GUIA_DE_USUARIO_PRESENTE}               //span[contains(text(),'Guia de usuário')]

### Criação de CTs
${SPAN_CRIACAO_DE_CTS_ADICIONAR}                 //div[@class='tcm-action-group']//span[@class='glyphicons glyphicons-plus']
${H4_CRIACAO_DE_CTS_LABEL_ADICIONAR}             id:addTestCaseLabel
${INPUT_CRIACAO_DE_CTS_NOME_TESTE_CASE}          id:testcasename
${BUTTOM_CRIACAO_DE_CTS_SALVAR_OK}               //h4[@id='addTestCaseLabel']//..//..//button[contains(text(),'OK')]
${SPAN_TRANSACOES}                               //crfo-panel[@title='Transações']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${SPAN_VALIDACOES_DE_HOST}                       //crfo-panel[@title='Validações de Host']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${SPAN_VALIDACOES_DE_HOST_TRANSACOES}            //div[@id='editTcHostvalidations']//h4[@class='ng-binding'][contains(text(),'transacoes')]/..//a[contains(text(),'Adicionar')]


### Objetivos                                
${SPAN_OBJETIVO}                                //span[contains(text(),'${caso_de_teste}')]//..//..//..//div//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${NAME_DESCRICION}                              name:description
${BUTTON_OK_OBJETIVOS}                          //div[@class='modal-dialog modal-lg modal-lg-dynamic tcm-tc-modal']//button[@type='button'][contains(text(),'OK')]
${BUTTON_SALVAR_DROPDOWN}                       //button[@class='btn btn-link dropdown-toggle']
${LINKTEXT_CRIAR_NOVA_VERSAO}                   link:Criar nova versão   
${BUTTON_ADICIONAR_GRUPO_OBJETIVOS}             //textarea[@name='description']//..//..//button
${INPUT_NAME_APPLICABILITY_RED}                 //input[@spellcheck='false'] 
${INPUT_NAME_APPLICABILITY_BLUE}                link:${caso_de_teste}
${STRONG_APPLICABILITY}                         //strong[contains(text(),'${applicabilitie}')]
${BUTTON_APPLICABILITY_PLUS}                    //button[@ng-click='addField(group);']
${INPUT_NAME_APPLICABILITY_RED_2}               //pre[not(contains(text(),'${applicabilitie}'))]
${DIV_SPINNER}                                  //div[@class='crfo-spinner crfo-spinner-lg']
                                   

### Transações
${SPAN_CAMPO_DE_ATUACAO}                         //crfo-panel[@title='${campo_de_atuacao}']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${BUTTON_ADICIONAR_TRANSACAO}                    //table[@class='table table-condensed ng-scope']//th[contains(text(),'Transação')]/../../../..//button[contains(text(),'Adicionar')]
${TD_CAMPO_TRANSACAO}                            //td[@class='has-error']//input[@name='name']
${INPUT_LOCALIZACAO_IMAGEM_CARTAO)}              //td[@class='has-error']//input[@required='required']
${SELECT_INTERFACE)}                             //td[@class='has-error']//input[@required='required']//..//..//..//select[@ng-model='tx.interfaceType']
${BUTTON_OK_TRANSACOES}                          //div[@id='editTcTransactions']//button[@type='button'][contains(text(),'OK')]
${BUTTON_ADICIONAR_GRUPO_TRANSAÇOES}             (//input[@name='name']//..//..//..//button)[last()] 
${INPUT_APPLICABILITY_RED_TRANSACOES}            (//input[@spellcheck='false'])[last()] 


### Guia de usuário
${SPAN_GUIA_DE_USUARIO}                          //crfo-panel[@title='Guia de usuário']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${BUTTON_ADICIONAR_GUIA_DE_USUARIO}              //h4[@id='editTcUserguideLabel']//..//..//td[contains(text(),'Pre Requisitos')]/..//a
${INPUT_DESCRICAO_GUIA_DE_USUARIO}               //td[@class='has-error']//input[@name='description']
${BUTTON_OK_GUIA_DE_USUARIO}                     //div[@id='editTcUserguide']//button[@type='button'][contains(text(),'OK')]
${A_PAGINA_INICIAL}                              //a[contains(text(),'Página inicial')]

### Validações de Host
${SPAN_ESCRITO_VALIDACOES_DE_HOST}               //span[contains(text(),'Validações de Host')]
${SPAN_VALIDACOES_DE_HOST_N/A}                   //span[contains(text(),'N/A')]
${BUTTON_VALIDACOES_DE_HOST_PROPRIEDADE_LISTA}   //span[contains(text(),'N/A')]//..//..//..//button[@class='btn btn-default btn-icon active']
${INPUT_VALIDACOES_DE_HOST_PROPRIEDADE_TEXTO}    //span[contains(text(),'N/A')]//..//..//..//input[@name='property']
${SELECT_VALIDACOES_DE_HOST_OPERADOR}            //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='hv.operator']
${INPUT_VALIDACOES_DE_HOST_VALOR_ESPERADO}       //span[contains(text(),'N/A')]//..//..//..//input[@name='expectedValue']
${BUTTON_VALIDACOES_DE_HOST_ASCII}               //span[contains(text(),'N/A')]//..//..//..//button[contains(text(),'ASCII ')]
${SELECT_VALIDACOES_DE_HOST_PERFIL}              //span[contains(text(),'N/A')]//..//..//..//button[contains(text(),'ASCII ')]//..//li//a[contains(text(),'Hex')]
${SELECT_VALIDACOES_DE_HOST_PASS}                //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='hv.passLevel']
${SELECT_VALIDACOES_DE_HOST_FAIL}                //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='hv.failLevel']
${TEXTAREA_VALIDACOES_DE_HOST_DESCRICAO}         //span[contains(text(),'N/A')]//..//..//..//textarea[@ng-model='hv.description']
${BUTTON_OK_VALIDACOES_DE_HOST}                  //div[@id='editTcHostvalidations']//button[@type='button'][contains(text(),'OK')]


### Validações de Usuário
${SPAN_ESCRITO_VALIDACOES_DE_USUARIO}            //crfo-panel[@title='Validações de usuário']//span[@class='glyphicon glyphicon-edit no-padding pull-right']
${INPUT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}    //span[contains(text(),'N/A')]//..//..//..//input[@ng-model='newInputValue']
${SPAN_VALIDACOES_DE_USUARIO_ADICIONAR}          //span[contains(text(),'N/A')]//..//..//..//span[@class='input-group-btn']
${SELECT_VALIDACOES_DE_USUARIO_VALOR_ESPERADO}   //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='uv.encodedExpectedValue']
${TEXTAREA_VALIDACOES_DE_USUARIO_DESCRICAO}      //span[contains(text(),'N/A')]//..//..//..//textarea[@ng-model='uv.description']   
${SELECT_VALIDACOES_DE_USUARIO_PASS}             //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='uv.passLevel']
${SELECT_VALIDACOES_DE_USUARIO_FAIL}             //span[contains(text(),'N/A')]//..//..//..//select[@ng-model='uv.failLevel']
${BUTTON_OK_VALIDACOES_DE_USUARIO}               //div[@id='editTcUservalidations']//button[@type='button'][contains(text(),'OK')]

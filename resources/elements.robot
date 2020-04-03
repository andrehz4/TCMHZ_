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

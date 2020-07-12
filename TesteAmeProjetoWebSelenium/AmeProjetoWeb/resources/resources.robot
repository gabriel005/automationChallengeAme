*** Settings ***
Library             SeleniumLibrary
Library             String

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com


*** Keywords ***
#### Setup e Teardown
Abrir navegador
  Open Browser     about:blank   ${BROWSER}

Fechar navegador
  Close Browser


### Ações
Dado que estou na tela home
  Go To   http://automationpractice.com
  Title Should Be   My Store

Quando eu efetuar o login
  Click Element                     xpath=//*[@id="header"]//a[@class="login"]
  wait until Element is Visible     xpath=//*[@id="email"]
  Input text                        xpath=//*[@id="email"]                             ${EMAIL}@ame.com
  Input text                        xpath=//*[@id="passwd"]                            ${PASSWORD}
  Click Element                     xpath=//*[@id="SubmitLogin"]


Quando eu efetuar o login em branco
  Click Element                     xpath=//*[@id="header"]//a[@class="login"]
  wait until Element is Visible     xpath=//*[@id="email"]
  ${PASSWORD}                       Generate Random String
  Input text                        xpath=//*[@id="passwd"]                            ${PASSWORD}
  Click Element                     xpath=//*[@id="SubmitLogin"]


E possuo conta cadastrada
  Click Element                     xpath=//*[@id="header"]//a[@class="login"]
  wait until Element is Visible     xpath=//*[@id="SubmitCreate"]
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  Input Text                        xpath=//*[@id="email_create"]           ${EMAIL}@ame.com
  Click Element                     xpath=//*[@id="SubmitCreate"]
  wait until Element is Visible     xpath=//*[@id="id_gender1"]
  Click Element                     xpath=//*[@id="id_gender1"]
  Input text                        xpath=//*[@id="customer_firstname"]     Gabriel
  Input text                        xpath=//*[@id="customer_lastname"]      Furtado
  Set Test Variable                 ${PASSWORD}                             123456
  Input text                        xpath=//*[@id="passwd"]                 ${PASSWORD}
  Input Text                        id=address1                             Rua invisivel
  Input Text                        id=city                                 Ribs
  Set Focus To Element              id=id_state
  Select From List By Index         id=id_state                             36
  Input Text                        id=postcode                             12345
  Input Text                        id=phone_mobile                         98819090
  Click Button                      submitAccount
  Click Element                     xpath=//*[@id="header_logo"]//img[@class="logo img-responsive"]
  Click Element                     xpath=//*[@id="header"]/div[2]//a[@class="logout"]

E insiro qualquer email
  ${EMAIL}                          Generate Random String
  Set Test Variable                 ${EMAIL}
  ${PASSWORD}                       Generate Random String
  Set Test Variable                 ${PASSWORD}


### Conferências
Então uma tela de sucesso deverá ser exibida
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
  Element Text Should Be           xpath=//*[@id="center_column"]/p       Welcome to your account. Here you can manage all of your personal information and orders.


Então uma tela de login invalido deverá ser exibida
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]//*[@class="alert alert-danger"]
  Element Text Should Be           xpath=//*[@id="center_column"]//li                                   Authentication failed.


Então uma mensagem "${MENSAGEM}" é exibido
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]//*[@class="alert alert-danger"]
  Element Text Should Be           xpath=//*[@id="center_column"]//li                                   ${MENSAGEM}

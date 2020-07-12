*** Settings ***
Resource            ../resources/resources.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Case ***
Cenário 01: Login sucesso
  Dado que estou na tela home
  E possuo conta cadastrada
  Quando eu efetuar o login
  Então uma tela de sucesso deverá ser exibida


Cenário 02: Login inválido
  Dado que estou na tela home
  E insiro qualquer email
  Quando eu efetuar o login
  Então uma tela de login invalido deverá ser exibida


Cenário 03: Login em branco
  Dado que estou na tela home
  Quando eu efetuar o login em branco
  Então uma mensagem "An email address required." é exibido

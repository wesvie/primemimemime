*** Settings ***
Documentation       Aqui estarão presentes todos os blablabla

Resource            ../resources/Resources.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a pagina home do site Automatio Practice
    Digitar o nome do produto "Blouse" no campo da pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

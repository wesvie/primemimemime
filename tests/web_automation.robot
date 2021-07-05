*** Settings ***
Documentation       Aqui estarão presentes todos os testes automatizados web.

Resource            ../resources/Resources.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]      Case1
    Acessar a pagina home do site Automatio Practice
    Digitar o nome do produto "Blouse" no campo da pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      Case2
    Acessar a pagina home do site Automatio Practice
    Digitar o nome do produto "ItemNãoExistente" no campo da pesquisa
    Clicar no botão pesquisar
    Conferir mansagem "No results were found for your search "ItemNãoExistente""

Caso de Teste 03: Listar Produtos
    [Tags]      Case3
    Acessar a pagina home do site Automatio Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os pordutos da sub categoria "Summer Dresses" foram mostrados na pagina

Caso de Teste 04: Cadastro
    [Tags]      Case4
    Acessar a pagina home do site Automatio Practice
    Clicar em Sign-in
    Informar um email valido
    Clicar em "Create an account"
    Preencher os dados obrigatorios
    Submeter cadastro
    Conferir cadastro com sucesso
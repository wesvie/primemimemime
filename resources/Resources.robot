*** Settings ***
Documentation       Aqui estarão presentes todas as Keywords e variaveis que usaremos no projeto Automação Web.

Library             SeleniumLibrary
Library             Strings

*** Variable ***
${BROWSER}          chrome
${URL}              http://automationpractice.com



*** Keywords ***
### Setup e teardown
Abrir navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser window

Fechar navegador
    Close Browser

Acessar a pagina home do site Automatio Practice
    Go To               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id='block_top_menu']/ul
    Title Should be                     My Store

Digitar o nome do produto "${PRODUTO}" no campo da pesquisa
    Input Text          name=search_query       ${PRODUTO}


Clicar no botão pesquisar
    Click Element       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Title Should be         Search - My Store
    Page Should Contain     xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
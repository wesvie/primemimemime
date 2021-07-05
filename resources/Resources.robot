*** Settings ***
Documentation       Aqui estarão presentes todas as Keywords e variaveis que usaremos no projeto Automação Web.

Library    Collections
Library             Selenium2Library 
Library             SeleniumLibrary
Library             Strings

*** Variable ***
${BROWSER}          chrome
${URL}              http://automationpractice.com
${EMAIL}            bruh_moment423@gmail.com



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
    Log To Console          Yo
    Page Should Contain Image     xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]

Conferir mansagem "${MENSAGEM}"
    Wait Until Element Is Visible       xpath=//*[@class='alert alert-warning']
    Element Should Contain              xpath=//*[@class='alert alert-warning']     No results were found for your search "ItemNãoExistente"


Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Wait Until Element Is Visible       xpath=//*[@title="${CATEGORIA}" and @class="sf-with-ul"]
    Mouse Over                          xpath=//*[@title="${CATEGORIA}" and @class="sf-with-ul"]


Clicar na sub categoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]//*[@title="Summer Dresses"]
    Click Element                       xpath=//*[@id="block_top_menu"]//*[@title="Summer Dresses"]

Conferir se os pordutos da sub categoria "${SUBCATEGORIA}" foram mostrados na pagina
    Page Should Contain                 text=${SUBCATEGORIA}


Clicar em Sign-in
    Wait Until Element Is Visible       xpath=//*[@class="login"]
    Click Element                       xpath=//*[@class="login"]


Informar um email valido
    Input Text      id=email_create     ${EMAIL}  

Clicar em "Create an account"
    Wait Until Element Is Visible       name=SubmitCreate
    Click Element                       name=SubmitCreate

Preencher os dados obrigatorios
    Wait Until Element Is Visible       xpath=//*[@id="id_gender1"]
    Click Element                       xpath=//*[@id="id_gender1"]
    ##Adcionar um nome
    ${NOME}         Catenate    mah name Deez
    Input Text      name=customer_firstname     ${NOME}
    ##Adcionar Sobrenome
    ${SOBRENOME}    Catenate    Nutz
    Input Text      name=customer_lastname     ${SOBRENOME}
    ##ADcionar email
    Input Text      name=email      ${EMAIL}
    ##adcionar Senha
    ${SENHA}        Catenate    123456
    Input Text      name=passwd         ${SENHA}
    ###Add nome
    Input Text      name=firstname      ${NOME}
    ###Add Sobrenome
    Input Text      name=lastname       ${SOBRENOME}
    ###Add Endereço
    ${ENDERÇO}      Catenate    Rua Kirby Return to Dreamland, 420
    Input Text      name=address1       ${ENDERÇO}
    ###Add  Cidade
    ${CIDADE}       Catenate    Ronaldinho Soccer 64
    Input Text      name=city           ${CIDADE}
    ###Add Estado
    Click Element   name=id_state
    Click Element   xpath=//*[@id="id_state"]//*[@value="1"]
    ###Add ZIP CODE
    ${ZIP}          Catenate    69420
    Input Text      name=postcode        ${ZIP}
    ###Add País
    Click Element   name=id_country
    Click Element   xpath=//*[@id="id_country"]//*[@value="21"]
    ###Add Celular
    ${CELULAR}      Catenate    5541999996666
    Input Text      name=phone_mobile     ${CELULAR}
    ###Add Referencia
    ${REF}          Catenate    Rua do lado 
    Input Text      name=alias             ${REF}

Submeter cadastro
    Wait Until Element Is Visible       name=submitAccount
    Click Element                       name=submitAccount

Conferir cadastro com sucesso
    Wait Until Element Is Visible       xpath=//*[@class="info-account"]
    Title Should Be                     My account - My Store

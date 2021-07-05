*** Settings ***
Documentation       Aqui estarão presentes 

Library             AppiumLibrary

Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo

*** Test Cases ***
Cenário: Pesquisar cursos do robot
    [Tags]          PESQUISA
    
    Dado que o cliente esteja na tela home
    E pesquisa por "robotframeworks"
    Quando clicar em Pesquisar
    Então serão apresentados videos sobre Robot Framework

Cenário: Binyot when corrupt?
    [Tags]          Binyot
    Dado que o cliente esteja na tela home
    E pesquisa por "Vinesauce Vinny"
    Quando clicar em Pesquisar
    Buscar o canal "channel_name"
    Rolar para baixo até "id=com.google.android.youtube:id/playlist_item"
    Selecionar video da playlist

#   Desafios
Caso de Teste 02: Logar no YouTube​
    [Tags]          Desafio1
    Dado que o cliente esteja na tela home
    Logar no aplicativo com a conta x​
    Entrar no menu “Explorar”​
    Usar swipe de tela até o 10 item da tela​​
    Clicar no vídeo 

Caso de Teste 03: Usar método Swipe na tela​​
    [Tags]          Desafio2
    Dado que o cliente esteja na tela home
    Entrar no menu “Explorar”​
    Usar swipe de tela até o 10 item da tela​​
    Clicar no vídeo


*** Keywords ***
Abrir o aplicativo
    Open Application            http://localhost:4723/wd/hub
    ...                         automationName=uiautomator2
    ...                         platformName=Android
    ...                         deviceName=pxl
    ...                         autoGrantPermissions=true
    ...                         appPackage=com.google.android.youtube
    ...                         appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
    Capture Page Screenshot 
    Close Application


Dado que o cliente esteja na tela home
    Wait Until Element Is Visible       accessibility_id=YouTube

E pesquisa por "${PESQUISA}"
    Wait Until Element Is Visible       accessibility_id=Search
    Click Element                       accessibility_id=Search
    Input Text                          id=com.google.android.youtube:id/search_edit_text       ${PESQUISA}

Quando clicar em Pesquisar
    Press keycode                       66


Então serão apresentados videos sobre Robot Framework
    Wait Until Element Is Visible       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout[1]/android.widget.ImageView
    Click Element                       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.widget.RelativeLayout[1]/android.widget.ImageView

Selecionar video da playlist
    Wait Until Element Is Visible       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout[1]/android.widget.ImageView
    Click Element                       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.RelativeLayout[1]/android.widget.ImageView

Buscar o canal "${CHANNEL_NAME}"
    Wait Until Element Is Visible       ${CHANNEL_NAME}
    Click Element                       ${CHANNEL_NAME}

Rolar para baixo até "${ELEMENT_NAME}"
    ${FOUND}    Run Keyword And Return Status    Element Should Be Visible   ${ELEMENT_NAME}
    FOR      ${count}    IN RANGE       0   20
        SLEEP                               0.05s
        ${FOUND} =  Run Keyword And Return Status    Element Should Be Visible   ${ELEMENT_NAME}
        Exit For Loop IF    "${FOUND}" == "True"
        Swipe By Percent                    50    80    50    0
        Log To Console                      ${count}
        Log To Console                      ${FOUND}
    END
    Click Element                       ${ELEMENT_NAME}

Logar no aplicativo com a conta x​
    Wait Until Element Is Visible       xpath=//android.widget.ImageView[@content-desc="Account"]
    Click Element                       xpath=//android.widget.ImageView[@content-desc="Account"]
    SLEEP                               1.2s
    ${FOUND}    Run Keyword And Return Status       Element Should Be Visible     id=com.google.android.youtube:id/button
    IF  "${FOUND}" == "True"
        Wait Until Element Is Visible       id=com.google.android.youtube:id/button
        Click Element                       id=com.google.android.youtube:id/button
        Wait Until Element Is Visible       id=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout
        Click Element                       id=com.google.android.youtube:id/thumbnail
    ELSE
        Click Element                       xpath=//android.widget.ImageButton[@content-desc="Close"]
    END


Entrar no menu “Explorar”​
    Wait Until Element Is Visible       xpath=//android.widget.Button[@content-desc="Trending"]
    Click Element                       xpath=//android.widget.Button[@content-desc="Trending"]

Usar swipe de tela até o ${num} item da tela​​
    Wait Until Element Is Visible       xpath=//android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout
    FOR     ${count}  IN RANGE      0   ${num}+1
        SLEEP                               0.05s
        Swipe By Percent                    50    60    50    30
    END


Clicar no vídeo
    Wait Until Element Is Visible       xpath=//android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout
    Click Element                       xpath=//android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout
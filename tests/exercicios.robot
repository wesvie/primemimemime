*** Settings ***
Documentation      aqui estarão os exercicios da prime experts.
Library    Collections

*** Variable ***
${NOME}        Wesley

&{PESSOAS}
...                 nome=Wesley
...                 sobrenome=Vieira
...                 idade=23
 
@{FRUTAS}       abacaxi     banana      pão     carburador      caixa de som      

*** Test Case ***
Cenario: Imprimir todas as informações da PESSOA contidas no dicionario

    Log To Console  ${PESSOAS.nome}
    Log To Console  ${PESSOAS.sobrenome}
    Log To Console  ${PESSOAS.idade}
    Log To Console  ${PESSOAS.idade}

Cenario: Imprimir todas as informações da PESSOA contidas no dicionario

    log many     @{FRUTAS}

Cenario: Sua mãe é um membro respeitavel da comunidade
    [Tags]      EMAIL   
    ${EMAIL}    Criar email     bruh        moment      420
    Log To Console   ${EMAIL}
    ${CONTADOR}     Conte até   69   420
    Log To Console      ${CONTADOR}  

Cenario: Sua mãe é um membro respeitavel da comunidade
    [Tags]      PAÍS   
    ${CONTADOR}     Pais list
    Log To Console      ${CONTADOR}  

Cenario: quem veio lá?
    [Tags]      whomst   
    Quem é  JO

Cenario: onde?
    [Tags]      ond   
    Onde estas





*** Keywords ***
Criar email
    [Arguments]     ${NOM}      ${SOB}      ${IDA}   
    ${MAIL}         Catenate    SEPARATOR=_ ${NOM}     ${SOB}     ${IDA}@robot.com
    [Return]        ${MAIL}

Somar os numeros "${NUM_A}" e "${NUM_B}"     
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}   
    [Return]        ${SOMA}

Conte até
    [Arguments]     ${MIN}      ${MAX}
    @{num}=    Create List
    FOR      ${count}    IN RANGE    ${MIN}      ${MAX}
        Append To List      ${num}      ${count}
    END
    [Return]        ${num}

Pais list
    @{paises}       Create List     italia      brazil      eua     inglaterra      russia
    FOR     ${paisin}    IN       @{paises}
        Log To Console      Estou em ${paisin}
    END


Quem é
    [Arguments]     ${nome}
    IF     '${nome}'=='MARIA'
        Log To Console  é a MARIA
    ELSE IF     '${nome}'=='JOÃO'
        Log To Console  é o JOÃO
    ELSE
        Log To Console  sei la irmão
    END

Onde estas
    ${numbers}=    Evaluate    random.sample(range(1, 11), 1)    random
    ${number}      Evaluate     random.randint(0, 11)
    IF     '${number}'=='5'
        Log To Console  estou no 5
    ELSE IF     '${number}'=='8'
        Log To Console  estou no 8
    ELSE
        Log To Console  sei la irmão, acho que ${number}
    END

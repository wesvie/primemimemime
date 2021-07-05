*** Settings ***
Documentation      aqui estarão os exercicios da prime experts.
Library    Collections

*** Variable ***
${NOME}        Wesley

&{PESSOAa}
...                 nome=Wesley
...                 sobrenome=Vieira
...                 idade=23
...                 gosto=tudo menos funk
...                 profissão=estudante

&{PESSOAb}
...                 nome=Caz
...                 sobrenome=Al'bé
...                 idade=65
...                 gosto=humor
...                 profissão=aposentado

&{PESSOAc}
...                 nome=Fabio
...                 sobrenome=Pancas
...                 idade=46
...                 gosto=jornalismo informativo
...                 profissão=dublê

@{PESSOAS}      &{PESSOAa}  &{PESSOAb}  &{PESSOAc}
 
@{FRUTAS}       abacaxi     banana      pão     carburador      caixa de som      

*** Test Case ***
Cenario: Imprimir todas as informações da PESSOA contidas no dicionario
    FOR    ${PESSOA}   IN  @{PESSOAS}
        Log To Console  ${PESSOA.nome} ${PESSOA.sobrenome}, tem ${PESSOA.idade} anos de idade, gosta de ${PESSOA.gosto} e trabalha como ${PESSOA.profissão}
        Log To Console      ${PESSOA.nome}  
        Log To Console      ${PESSOA.sobrenome}  
        Log To Console      ${PESSOA.idade}  
        Log To Console      ${PESSOA.gosto}  
        Log To Console      ${PESSOA.profissão} 
        Log To Console      \n
    END


Cenario: Imprimir todas as frutas
    FOR    ${FRUTA}   IN  @{FRUTAS}
        Log To Console  ${FRUTA}
    END

Cenario: Criar email
    [Tags]      EMAIL   
    ${EMAIL}    Criar email     bruh        moment      420
    Log To Console   ${EMAIL}

Cenario: Contar de 0 a 100
    ${CONTADOR}     Conte até   0   100
    Log To Console      ${CONTADOR}  

Cenario: contar países
    [Tags]      PAÍS   
    ${CONTADOR}     Pais list

Cenario: quem veio lá?
    [Tags]      whomst   
    Quem é  JOÃO
    Quem é  MARIA
    Quem é  JOJO BIZARRE ADVENTURE

Cenario: onde?
    [Tags]      ond   
    Onde estas





*** Keywords ***
Criar email
    [Arguments]     ${NOM}      ${SOB}      ${IDA}   
    ${MAIL}         Catenate    SEPARATOR=_     ${NOM}     ${SOB}     ${IDA}@robot.com
    [Return]        ${MAIL}

Somar os numeros "${NUM_A}" e "${NUM_B}"     
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}   
    [Return]        ${SOMA}

Conte até
    [Arguments]     ${MIN}      ${MAX}
    ${num}      Catenate    ${EMPTY}
    FOR      ${count}    IN RANGE    ${MIN}      ${MAX}+1
        IF          ${count}==${MIN}
            ${num}      Catenate        ${count}
        ELSE IF     ${count}==${MAX}
            ${num}      Catenate        ${num}      e ${count}
        ELSE
            ${num}      Catenate        ${num}, ${count}
        END
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
    ${number}      Evaluate     random.randint(0, 11)
    IF     '${number}'=='5'
        Log To Console  estou no 5
    ELSE IF     '${number}'=='8'
        Log To Console  estou no 8
    ELSE
        Log To Console  sei la irmão, acho que ${number}
    END

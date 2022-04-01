*** Settings ***
Library         RequestsLibrary
Library         JsonValidator

*** Variables ***
${URL}              http://localhost:3000

*** Test Cases ***
Cenário 01 - Validar contrato da API do seu zé
    Dado que leonardo efetua um get na rota
    Então Leonardo valida se o contrato da API esta correto

*** Keywords ***
Dado que leonardo efetua um get na rota
    ${headers}=               Create Dictionary        Content-Type=application/json
    Create Session  data        ${URL}
    ${RESPOSTA}  Get on Session     data     ${URL}/data    headers=${headers}
    SET GLOBAL VARIABLE  ${RESPOSTA}

Então Leonardo valida se o contrato da API esta correto
    Validate Jsonschema From File	  ${RESPOSTA.json()}   ${CURDIR}/JsonSchema.json
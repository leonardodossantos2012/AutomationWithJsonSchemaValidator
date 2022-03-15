*** Settings ***
Library         RequestsLibrary
Library         JsonValidator

*** Variables ***
${URL}              http://localhost:3000

*** Test Cases ***
Cenário 01 - Validar contrato da API
    Dado que leonardo efetua um get na rota
    Então valido o schema da API

*** Keywords ***
Dado que leonardo efetua um get na rota
    ${headers}=               Create Dictionary        Content-Type=application/json
    Create Session  data        ${URL}
    ${RESPOSTA}  Get on Session     data     ${URL}/data    headers=${headers}
    SET GLOBAL VARIABLE  ${RESPOSTA}

Então valido o schema da API
    Validate Jsonschema From File	  ${RESPOSTA.json()}   ${CURDIR}/JsonSchema.json
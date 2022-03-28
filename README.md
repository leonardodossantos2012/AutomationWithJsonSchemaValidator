### Sobre o projeto
O projeto de automação de testes tem como objetivo mostrar a funcionalidade do test template e a validação de contratos das APIs usando 
a library json validator, iremos abordar a utilização do json server para subirmos nossa aplicação de teste mocada.  

### Instalação
Os pré-requisitos para rodar o projeto são:
- IDE configurada(utilizo como default o PyCharm)
- Instalar o python mais recente
- executar as seguintes instalações no seu terminal:
    ```sh
    1 - cd C:\{PATH}\testCaseWithTestTemplate
    2 - pip3 install -r .\requirements.txt
    ```

### Subindo a aplicação com o json server
Após a instalação do json server, abra o terminal na sua máquina e execute os seguintes comandos:
```bash
1 cd C:\{PATH}\testCaseWithTestTemplate\jsonServer
2 json-server .\db.json
```

Após a execução deverá apresentar o seguinte resultado no terminal:
```shell
INFO:aiohttp.server:JSON Server v0.1.9/CPython 3.10.0 - by Gerald
====================
Local:  http://[::1]:3000
---
Local:  http://localhost:3000
Remote: http://192.168.0.103:3000
====================
```
Pronto, o nosso json server foi iniciado e esta pronto para rodar as automações.

### Validação de contrato da API
Para garantirmos que o contrato da API não vai ser quebrado utilizei a library do json validator e passei a keyword ***Validate Jsonschema From File***
essa keyword tem o intuito de comparar o jsonSchema do contrato com o retorno do schema da API, caso tenha alguma diferença é retornado um erro no cenário informando 
que o contrato esta diferente do que foi criado.
```robotframework
Então valido o schema da API
    Validate Jsonschema From File	  ${RESPOSTA.json()}   ${CURDIR}/JsonSchema.json
```

## 🤖 Bora rodar a automação?

Para executar a automação basta executar os seguintes comandos no terminal:
```sh
  cd C:\{PATH}\testCaseWithTestTemplate
  robot -d ./results .\testCase\validarTestTemplate.robot
```
E devera aparecer a seguinte saída:
```robotframework
==============================================================================
ValidarJsonSchema
==============================================================================
Cenário 01 - Validar contrato da API                                  | PASS |
------------------------------------------------------------------------------
ValidarJsonSchema                                                     | PASS |
1 test, 1 passed, 0 failed
==============================================================================
```

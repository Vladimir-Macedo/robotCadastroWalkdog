*** Settings ***

Resource    ${EXECDIR}/resources/base.resources.robot

Test Setup              Start session
Test Teardown           Finish session 

*** Test Cases ***
Cadastro de dog walker com sucesso  
    [Tags]                          happy_path     
    [Documentation]                 Cadastro de dog walker com sucesso

    Submit dog walker signup        John Doe    johndoe@example     77266787041      12345-678       123     Apt 101 
    Popup Have Text                 Recebemos o seu cadastro e em breve retornaremos o contato.

CPF incorreto
    [Tags]                          cpf_inv
    [Documentation]                 CPF incorreto

    Submit dog walker signup        John Doe    johndoe@example     123.456.789-10      12345-678       123     Apt 101 
    Alert Have Text                 CPF inválido
   
Email incorreto
    [Tags]                          email_inv
    [Documentation]                 Teste de email incorreto 

    Submit dog walker signup        John Doe    johndoe&example     12345678901      12345-678       123     Apt 101 
    Alert Have Text                 Informe um email válido
   
Campo obrigatórios
    [Tags]                              required
    [Documentation]                     Campo obrigatórios
    
    Botao Cadastrar 
    Alert Have Text                 Informe o seu nome completo
    Alert Have Text                 Informe o seu melhor email
    Alert Have Text                 Informe o seu CPF
    Alert Have Text                 Informe o seu CEP
    Alert Have Text                 Informe um número maior que zero
    Alert Have Text                 Adcione um documento com foto (RG ou CHN)


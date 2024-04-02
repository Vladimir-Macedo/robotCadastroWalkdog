
*** Settings ***

Documentation                  Arquivo que representa a pagina de cadastro com acoes e elementos

Library                        SeleniumLibrary

*** Variables ***

${BTN_CADASTRAR}     Set Variable      xpath=//button[contains(text(), "Cadastrar")]

*** Keywords ***
Submit dog walker signup 
    [Arguments]    ${NOME}    ${EMAIL}    ${CPF_CORRETO}    ${CEP}      ${NUMERO}       ${COMPLEMENTO}       
    
    Wait Until Element is Visible       css=input[name="name"] 

    Input Text      css=input[name="name"]              ${NOME} 
    Input Text      css=input[name="email"]             ${EMAIL}
    Input Text      css=input[name="cpf"]               ${CPF_CORRETO}
    Input Text      css=input[name="cep"]               ${CEP}
    Input Text      css=input[name="addressNumber"]     ${NUMERO}
    Input Text      css=input[name="addressDetails"]    ${COMPLEMENTO}
    Choose File     css=input[type="file"]              ${EXECDIR}\\fixtures\\Documet.png  
    
    Click Element   xpath=//button[contains(text(), "Cadastrar")]

Popup Have Text
    [Arguments]     ${expected_text}

    ${element}      Set Variable    xpath=//*[@id="swal2-html-container"]
    Wait Until Page Contains Element    ${element}
    Element Should Contain              ${element}     ${expected_text}
    
    #Wait Until Page Contains Element    //*[@id="swal2-html-container"]
    #Page Should Contain Element        //*[@id="success-message"]

Alert Have Text 
    [Arguments]     ${expected_text}  

    ${element}      Set Variable    xpath=//span[@class="alert-error"][text()="${expected_text}"]

    Element Should Be Visible     ${element}
    Capture Element Screenshot    ${element}  

Botao Cadastrar 
    Click Element   xpath=//button[contains(text(), "Cadastrar")]

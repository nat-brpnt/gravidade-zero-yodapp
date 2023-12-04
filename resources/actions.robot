*** Settings ***
Documentation        Ações customizadas do yodapp

Library    Browser

*** Keywords ***

Go To Home Page
    	Go To    ${BASE_URL}

        Wait For Elements State        css=.carousel        visible        5

Go to User Form 
    Click               text=Novo

    # Checkpoint para saber se o teste foi para a página de Cadastro
    Wait For Elements State    css=.card-header-title >> text=Cadastrar novo usuário    
    ...    visible    5
    
Fill User Form 
    [Arguments]    ${user}

    Fill Text    css=input[name="nome"]    ${user}[name]
    Fill Text    css=input[name="email"]   ${user}[email]
    
    Select Options By    css=.ordem select    text    ${user}[ordem]

    Select Birthday    ${user}[bdate]

    Fill Text    id=insta                          ${user}[instagram]


Select Jedi
    [Arguments]    ${tpjedi}

    Click          xpath=//input[@value="${tpjedi}"]/..//span[@class="check"]

Select Birthday
    [Arguments]    ${text_date}

    @{date}    Split String    ${text_date}    -

    Click    css=input[name="Data de nascimento"]

    Select Options By    xpath=(//header[@class="datepicker-header"]//select)[1]    
    ...    text     ${date}[0]
    Select Options By    xpath=(//header[@class="datepicker-header"]//select)[2]    
    ...    value    ${date}[1]
    Click    xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]

Check Communications
    Click                xpath=//input[@name="comunications"]/../span[@class="check"]

Submit User Form 
    Click        css=button >> text=Cadastrar

Toaster Message Should Be     
    [Arguments]    ${expected_message}

    ${element}     Set Variable            css=.toast div

    Wait For Elements State     ${element}        visible        5
    Get Text                    ${element}        equal          ${expected_message}

User Should Be visible
    [Arguments]       ${user}

    ${element}        Set Variable        xpath=//td[contains(text(), "${user}[email]")]/..

    Wait For Elements State    ${element}        visible        5
    Get Text    ${element}     contains          ${user}[name]
    Get Text    ${element}     contains          ${user}[instagram]
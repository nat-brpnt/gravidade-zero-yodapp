*** Settings ***
Documentation           Suite de testes do cadastro de personagens

Library                 ${EXECDIR}/resources/factories/users.py

Resource                ${EXECDIR}/resources/base.robot
Resource    ../resources/actions.robot

Test Setup              Start Session
Test Teardown           End Session


*** Test Cases ***
Deve cadastrar novo personagem
    [Tags]     happy

    ${user}    Factory Yoda

    Go to User Form
    Fill User Form    ${user}
    Select Jedi       ${user}[tpjedi]
    Check Communications
    Submit User Form
    Toaster Message Should Be    Usuário cadastrado com sucesso!
    Go To Home Page
    User Should Be visible    ${user}


Email inválido
    [Tags]     inv_email

    ${user}    Factory Darth Vader
    Go to User Form  
    Fill User Form    ${user}
    Submit User Form
    Toaster Message Should Be    Oops! O email é invalido. 
 
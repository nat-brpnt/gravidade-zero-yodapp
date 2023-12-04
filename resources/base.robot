*** Settings ***
Documentation        Arquivo principal do projeto

Library         Browser
Library         String

Resource        actions.robot

*** Variables ***
${BASE_URL}            https://yodapp-testing.vercel.app

*** Keywords ***
Start Session
    New Browser         chromium    headless=False    slowMo=00:00:00
    
    New Page            ${BASE_URL}

End Session
    Take Screenshot
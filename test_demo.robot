*** Settings ***
Library         SystemStarterLibrary
Library         AsyncLibrary

*** Keywords ***
#@run async
System_1
    [Arguments]  ${sleepTime}
    log to console  101
    log to console  102
    sleep  ${sleepTime}
    log to console  103
    #${sum}=     evaluate    ${num1} + ${num2}
    #log to console  ${sum}
    sleep  ${sleepTime}
    log to console  104

#@run async
System_2
    [Arguments]  ${sleepTime}
    log to console  201
    log to console  202
    log to console  203
    sleep  ${sleepTime}
    log to console  204

*** Test Cases ***
Test case 1
    [Documentation]  Example test case 1
    #${SYSTEM1_STARTED}=  System_1
    #${SYSTEM2_STARTED}=  System_2
    #async run  ${SYSTEM1_STARTED}
    #async run  System_2
    #async run  System_1
    #async runner  System_1  System_2  2
    #${return_value}     async get   ${handle1}
    #${handle2}   async run  System_1
    #async run  System_2
    #${return_value}     async get   ${handle2}
    ${system1}=     asynchronously start system 1
    ${system2}=     asynchronously start system 2
    wait until  ${system1}  ${system2}
    #${system1}=     System_1  2
    #${system2}=     System_2  2
    #wait until  ${system1}  ${system2}

    #async run  System_1  2
    #async run  System_2  2
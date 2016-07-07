*** Settings ***
Documentation   Example of using parallel things
Suite Setup     StartSystems
Library         SystemStarterLibrary.py

*** Test Cases ***
... Here should be my tests

*** Keywords ***
StartSystems
   ${SYSTEM1_STARTED}=  Asynchronously Start System 1
   ${SYSTEM2_STARTED}=  Asynchronously Start System 2
   Wait until  ${SYSTEM1_STARTED}  ${SYSTEM2_STARTED}
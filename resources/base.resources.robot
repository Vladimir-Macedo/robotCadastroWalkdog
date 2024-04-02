
*** Settings ***
Documentation       Tudo comeca aqui

Library             SeleniumLibrary

Resource           pages/SignupPage.robot    

*** Variables ***
${URL}               http://walkdog.vercel.app/signup
${BROWSER}           ff
${DELAY}             5S 

*** Keywords ***
Start session
   Open Browser                ${URL}    ${BROWSER}
   #Set Window Size   1920     1080
   Maximize Browser Window

Finish session
   Capture Page Screenshot             
   Close Browser
*** Settings ****
Documentation   Suite 5 avaliar Prestador
Resource    resource.robot
# ..............................................................
# utilize o script  teste_04_novoPrestador.sql para auxiliar nos testes


*** Variables ***
${CONDOMINIO}       Condominio Teste Automatizado 
${CNPJ}             11232301027
${EMPRESA}          Prestador Teste Automatizado  
${ESPECIALIDADE}    Saúde - Fisioterapeuta
${CEP}              09751000
${NUMERO}           1395
${COMPLEMENTO}      Sala 95 Torre Norte
${EMAIL}            prestador.teste@thelittleorange.app
${CELULAR}          11 98258 1115 
${MORADOREMAIL}     morador.teste@thelittleorange.app
${MORADORSENHA}     segredo
*** Test Cases  ***


# .............................................. faz o login  
05:01 Login no aplicativo
    Acessar pagina home do site 
    Clicar no botao Acessar
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    ${MORADOREMAIL}
    Input Text  id=senha    ${MORADORSENHA} 
    Pressionar Entrar     
    
# .............................................. localiza especialidade  
05:02 Seleciona Especialidade
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-specialty/app-app/div[2]/button
    Element Should contain  xpath=/html/body/app-root/app-specialty/app-app/div[2]/button   Fisioterapeuta
    Click Element    xpath=/html/body/app-root/app-specialty/app-app/div[2]/button

# .............................................. localiza prestador
05:02 Seleciona Prestador
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-professional/app-app/div[2]/button
    Element Should contain  xpath=/html/body/app-root/app-professional/app-app/div[2]/button  Prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-professional/app-app/div[2]/button

05:03 Mostra Tela do Profissional
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-profile/app-app/div[2]/div[1]
    Element Should contain  xpath=/html/body/app-root/app-profile/app-app/div[2]/div[1]  Prestador Teste Automatizado

# .............................................. clica no mapa
 
 #   Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[2]/a[1]

# .............................................. clica no fone
 #   Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[2]/a[2]

# .............................................. clica no whatsapp
 #   Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[2]/a[3]

# .............................................. clica em avaliar
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[3]/div[1]/button

# .............................................. define estrela
05:03 Avalia 1 estrela
    Sleep   2 
    Click Element    xpath=//*[@id="notaAvaliacao"]/span/span[2]/button
    Input Text      id=mensagem   1 estrela texto de avaliacao do prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-evaluation/app-app/div[2]/form/div/div[3]    
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Sleep   2 


05:03 Avalia 2 estrelas
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[3]/div[1]/button
    Sleep   2 
    Click Element    xpath=//*[@id="notaAvaliacao"]/span/span[4]/button
    Input Text      id=mensagem   2 estrela2 texto de avaliacao do prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-evaluation/app-app/div[2]/form/div/div[3]    
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button    
    Sleep   2 
    
05:03 Avalia 3 estrelas
    Sleep   2 
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[3]/div[1]/button
    Sleep   2 
    Click Element    xpath=//*[@id="notaAvaliacao"]/span/span[6]/button
    Input Text      id=mensagem   3 estrela2 texto de avaliacao do prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-evaluation/app-app/div[2]/form/div/div[3]    
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button  
    Sleep   2 
    
05:03 Avalia 4 estrelas
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[3]/div[1]/button
    Sleep   2 
    Click Element    xpath=//*[@id="notaAvaliacao"]/span/span[8]/button
    Input Text      id=mensagem   4 estrela2 texto de avaliacao do prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-evaluation/app-app/div[2]/form/div/div[3]    
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button  
    Sleep   2 
   
05:03 Avalia 5 estrelas
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/div[3]/div[1]/button
    Sleep   2 
    Click Element    xpath=//*[@id="notaAvaliacao"]/span/span[10]/button
    Input Text      id=mensagem   5 estrela2 texto de avaliacao do prestador Teste Automatizado
    Click Element    xpath=/html/body/app-root/app-evaluation/app-app/div[2]/form/div/div[3]    
    Sleep   2 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button  
    Sleep   2 
     

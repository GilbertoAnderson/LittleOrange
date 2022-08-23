*** Settings ****
Documentation   Suite de automação novo prestador
Resource    resource.robot


*** Variables ***
${CONDOMINIO}       Auguri Residence | Living
${CNPJ}             20633365807
${EMPRESA}          Uchida Fisioterapia  
${ESPECIALIDADE}    Saúde - Fisioterapeuta
${CEP}              09751000
${NUMERO}           1395
${COMPLEMENTO}      Sala 95 Torre Norte
${EMAIL}            usuarioteste@thelittleorange.app
${CELULAR}          11 98258 1115 
${CANALEMAIL}       gilberto.anderson@gmail.com
${CANALSENHA}       segredo
*** Test Cases  ***


Adiciona Novo Prestador
# .............................................. faz o login  
    Acessar pagina home do site 
    Clicar no botao Acessar
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    ${CANALEMAIL}
    Input Text  id=senha    ${CANALSENHA} 
    Pressionar Entrar       
    Sleep   5 
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-condominium/app-app/div[1]/div
    Click Element    xpath=/html/body/app-root/app-condominium/app-app/div[1]/div/button
    Click Element    xpath=/html/body/app-root/app-condominium/app-app/div[1]/div/ul/li[4]/a
# .............................................. cadastra o novo prestador
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div      
    Sleep   5 
    Wait Until Element Is Visible     id=idCondominio 
    Set Focus To Element  id=idCondominio   
    Select From List by label   id=idCondominio   ${CONDOMINIO} 
    Input Text  id=cpf_Cnpj     ${CNPJ} 
    Input Text  id=empresa     ${EMPRESA} 
    Click Element   id=idEspecialidade  
    Click Element   xpath=//*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]
    Press Keys    //*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]   ${ESPECIALIDADE}+ENTER 
    Input Text  id=cep      ${CEP}   
    Set Focus To Element  id=endereco    
    Input Text  id=numero   ${NUMERO}  
    Input Text  id=complemento   ${COMPLEMENTO}
    Set Focus To Element   id=bairro   
    Set Focus To Element  id=cidade   
    Set Focus To Element  id=uf      
    Set Focus To Element  id=pais     
    Input Text  id=email      ${EMAIL}
    Input Text  id=celular     ${CELULAR}    
    Set Focus To Element  id=fone    
    Sleep   5
    Click Element    xpath=/html/body/app-root/app-create/app-app/div[2]/form/div/div[17]/button    
    Sleep   5 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Profissional adicionado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Fechar Navegador


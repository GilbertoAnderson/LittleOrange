*** Settings ****
Documentation   Suite 03 novo Morador
Resource    resource.robot
# ..............................................................
# utilize o script  teste_03_novoMorador.sql para auxiliar nos testes

*** Variables ***
# .............................................. dados do morador
${NOME}             Morador teste Automatizado
${DATANASCIMENTO}   25/12/1985
${CPF}              11232301027
${EMAIL}            morador.teste@thelittleorange.app
${CELULAR}          11 91114 1115 
${SENHA}            segredo
# .............................................. dados do condominio
${CONDOMINIO}       Condominio Teste Automatizado 
${CEP}              09230590 
${NUMERO}           1300
${COMPLEMENTORO} 

*** Test Cases  ***


# .............................................. pagina inicial 
Caso Teste 01.00: Acessa tela inicial
    Acessar pagina home do site 
    Clicar no botao Acessar
    Ir para tela Inicial
    Clicar link Criar nova conta


# .............................................. pagina cadastro usuario
Caso Teste 02.01: Cadastra novo morador
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-register/app-app/div[2]
    Page Should contain     Criar uma conta    
    Input Text  id=nome             ${NOME} 
    Input Text  id=dtNascimento     ${DATANASCIMENTO}
    Input Text  id=cpf_Cnpj         ${CPF}      
    Input Text  id=email            ${EMAIL}
    Input Text  id=celular          ${CELULAR} 
    Input Text  id=senha            ${SENHA}
    Input Text  id=repita_senha     ${SENHA}
    Click Element    xpath=/html/body/app-root/app-register/app-app/div[2]/form/div/div[9]/button
    Sleep   5s       
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Page Should contain     Cadastro realizado. Agora você pode adicionar seu primeiro condomínio.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button



# .............................................. pagina cadastro condominio
Caso Teste 03.01: Cadastra novo condominio
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Page Should contain     Cadastro realizado. Agora você pode adicionar seu primeiro condomínio.
    Click Element   xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div
    Page Should contain     Novo condomínio   
    Input Text  id=nome         ${CONDOMINIO}   Condominio Teste Automatizado   
    Input Text  id=cep          ${CEP}    
    Input Text  id=numero       ${NUMERO}
    Input Text  id=complemento  ${COMPLEMENTORO}   
    Set Focus To Element  id=endereco  
    Set Focus To Element  id=complemento   
    Set Focus To Element  id=bairro   
    Set Focus To Element  id=cidade   
    Set Focus To Element  id=uf      
    Set Focus To Element  id=pais     
    Set Focus To Element  id=fone   
    Sleep   5s       
    Click Element   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div/div[11]/button    
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Condomínio adicionado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button


    
# .............................................. fecha o browser
    Fechar Navegador
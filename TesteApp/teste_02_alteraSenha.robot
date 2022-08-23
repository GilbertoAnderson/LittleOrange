*** Settings ****
Documentation   Suite 02 alteracao senha
Resource    resource.robot

# .............................................. 
# utilize o script teste_01_acessoUsuarioSenha.sql  para auxiliar nos testes

*** Variables ***

# .............................................. dados do teste
${UsuarioCorreto}       usuario.teste@thelittleorange.app
${UsuarioIncorreto}     usuarioteste@thelittleorange.app
${SenhaCorreta}         segredo
${SenhaNova}            90697947


*** Test Cases  ***

Caso Teste 01.08: Esqueci a senha - altera a senha
    Acessar pagina home do site 
    Clicar no botao Acessar
    Input Text  id=email    ${UsuarioCorreto}
    Input Text  id=senha    ${SenhaNova} 
    Pressionar Entrar        
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[1]/div/button
    Click Element    xpath=/html/body/app-root/app-create/app-app/div[1]/div/button
    Click Element    xpath=/html/body/app-root/app-create/app-app/div[1]/div/ul/li[6]/a
# .................................................................    Preenche Senhas  
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-profile/app-app
    Input Text  id=senha            ${SenhaCorreta}
    Input Text  id=repita_senha     ${SenhaCorreta}
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/form/div/div[11]/button
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should contain     Cadastro atualizado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/form/div/div[11]/button
    Fechar Navegador
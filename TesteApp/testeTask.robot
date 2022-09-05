*** Settings ****
Documentation   Suite 01 acesso usuario e senha
Resource    resource.robot
# .............................................. 
# utilize o script teste_01_acessoUsuarioSenha.sql  para auxiliar nos testes


*** Variables ***

# .............................................. dados do teste
${UsuarioCorreto}       usuario.teste@thelittleorange.app
${UsuarioIncorreto}     usuarioteste@thelittleorange.app
${SenhaCorreta}         segredo
${SenhaIncorreta}       segredx
${SenhaNova}            segredonovo
${MsgErroLogin}         Credenciais inválidas!
${MsgInstrucaoEnviada}  Instruções de redefinição de senha enviada para seu e-mail.
${MsgNaoEncontrado}     Não encontrado

# .............................................. dados do morador
${NOME}             Usuario teste Automatico
${DATANASCIMENTO}   25/12/1985
${CPF}              113.380.650-33
${EMAIL}            usuario.teste@thelittleorange.app
${CELULAR}          11 91114 1115 
${SENHA}            segredo
*** Test Cases  ***

# .............................................. cria novo usuario para o teste

# .............................................. pagina inicial 
Caso Teste 02.00: Acessa tela inicial
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
    Click Element     id=senha 
    Sleep   5s    
    Click Element   xpath=/html/body/app-root/app-register/app-app/div[2]/form/div/div[9]/button
    Sleep   5s
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Cadastro realizado. Agora você pode adicionar seu primeiro condomínio.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button
    Fechar Navegador

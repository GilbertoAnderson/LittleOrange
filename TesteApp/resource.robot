*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}      https://thelittleorange.app
${MsgErroLogin}  Credenciais inválidas!
${MsgInstrucaoEnviada}  Instruções de redefinição de senha enviada para seu e-mail.
${MsgNaoEncontrado}     Não encontrado
${NovaSenha}    segredo

*** Keywords  ***
Acessar pagina home do site 
    Open Browser    url=${URL}  browser=${BROWSER}

Clicar no botao Acessar
    Wait Until Element Is Visible   xpath=/html/body/nav/div/div/a[2]
    Click Element    xpath=/html/body/nav/div/div/a[2]

Clicar link Esqueceu Senha  
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-auth/div/form/div/div[4]/button
    Click Element    xpath=/html/body/app-root/app-auth/div/form/div/div[4]/button

Clicar link Criar nova conta
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-auth/div/form/div/div[5]/button
    Click Element    xpath=/html/body/app-root/app-auth/div/form/div/div[5]/button

Preencher Campo Email   
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    ${UsuarioCorreto}
    
Preencher Campo Password     
    Input Text  id=senha    ${SenhaCorreta}

Preencher Campo Nova Senha 
    Input Text  id=senha    ${NovaSenha}

Pressionar Entrar
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-auth/div/form/div/div[3]/button
    Click Element    xpath=/html/body/app-root/app-auth/div/form/div/div[3]/button

Fechar Navegador
    Close Browser

Preencher Campo Email Incorreto     
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    ${UsuarioIncorreto}

Preencher Campo Password Incorreta 
    Input Text  id=senha    ${SenhaIncorreta}


Clicar no botao Cancelar
    Click Element    xpath=/html/body/app-root/app-recover/app-app/div[2]/form/div/div[3]/button

Clicar no botao Pesquisar
    Click Element    xpath=/html/body/app-root/app-recover/app-app/div[2]/form/div/div[2]/button


Mensagem de Erro Login
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should Contain     ${MsgErroLogin}
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button

Mensagem de Erro Esqueceu Senha
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should Contain     ${MsgErroLogin}
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button

Mensagem de Instrucoes Enviadas
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should Contain     ${MsgInstrucaoEnviada}
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button

Mensagem de Erro Nao Encontrado
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should contain     ${MsgNaoEncontrado}
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button

    
Lista Condominios
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-condominium/app-app/div[1]/h2
    Page Should contain   Condomínios

Menu Hamburguer
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-specialty/app-app/div[1]/div/button/span
    Click Element    xpath=/html/body/app-root/app-specialty/app-app/div[1]/div/button/span

Selecione Configuracoes
    Click Element    xpath=/html/body/app-root/app-condominium/app-app/div[1]/div/ul/li[6]/a

Selecione Novo Prestador
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-specialty/app-app/div[1]/div
    Click Element    xpath=/html/body/app-root/app-specialty/app-app/div[1]/div
    Click Element    xpath=/html/body/app-root/app-specialty/app-app/div[1]/div/ul/li[4]/a

Preenche Senhas
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-profile/app-app
    Input Text  id=senha            ${SenhaCorreta}
    Input Text  id=repita_senha     ${SenhaCorreta}
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/form/div/div[11]/button
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal/div[2]
    Page Should contain     Cadastro atualizado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button
    Click Element    xpath=/html/body/app-root/app-profile/app-app/div[2]/form/div/div[11]/button

Ir para tela Inicial
    Wait Until Element Is Visible   xpath=/html/body/app-root
    Page Should contain     Esqueceu a senha
    Page Should contain     Criar nova conta


Preencher nova conta
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-register/app-app/div[2]
    Page Should contain     Criar uma conta    
    Input Text  id=nome    Morador teste Automatico01
    Input Text  id=dtNascimento     25/12/1985
    Input Text  id=cpf_Cnpj     11232301027    
    Input Text  id=email    TesteAutomatico@teste.com
    Input Text  id=celular  11911141115
    Input Text  id=senha    ${SenhaCorreta}
    Input Text  id=repita_senha    ${SenhaCorreta}
    Click Element    xpath=/html/body/app-root/app-register/app-app/div[2]/form/div/div[9]/button
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div
    Page Should contain     Cadastro realizado. Agora você pode adicionar seu primeiro condomínio.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button


Adicionar Condominio
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div
    Page Should contain     Novo condomínio   
    Input Text  id=nome     Condominio Teste Automatizado   
    Input Text  id=cep      09230590   
    Set Focus To Element  id=endereco    
    Input Text  id=numero   1300
    Set Focus To Element    id=complemento   
    Set Focus To Element   id=bairro   
    Set Focus To Element  id=cidade   
    Set Focus To Element  id=uf      
    Set Focus To Element  id=pais     
    Input Text  id=fone     11 98988989  
    Sleep   5s       
    Click Element   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div/div[11]/button    
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Condomínio adicionado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button


Adiciona Novo Prestador
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div      
    Sleep   5 
    Wait Until Element Is Visible     id=idCondominio 
    Set Focus To Element  id=idCondominio   
    Select From List by index   id=idCondominio   1  
    Input Text  id=cpf_Cnpj     11232301027
    Select Checkbox     myBusiness
    Input Text  id=empresa     Prestador Teste Automatizado  
    Click Element   id=idEspecialidade  
    Click Element   xpath=//*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]
    Press Keys    //*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]   Construção - Arquiteto+ENTER 
    Input Text  id=cep      09230590   
    Set Focus To Element  id=endereco    
    Input Text  id=numero   1300
    Set Focus To Element    id=complemento   
    Set Focus To Element   id=bairro   
    Set Focus To Element  id=cidade   
    Set Focus To Element  id=uf      
    Set Focus To Element  id=pais     
    Input Text  id=email    TesteAutomatico@teste.com   
    Input Text  id=celular      11911141115    
    Set Focus To Element  id=fone    
    Sleep   5
    Click Element    xpath=/html/body/app-root/app-create/app-app/div[2]/form/div/div[17]/button    
    Sleep   5 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Profissional adicionado.
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[3]/button



    
Adiciona Prestador Duplicado
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-create/app-app/div[2]/form/div      
    Sleep   5 
    Wait Until Element Is Visible     id=idCondominio 
    Set Focus To Element  id=idCondominio   
    Select From List by index   id=idCondominio   1  
    Input Text  id=cpf_Cnpj     11232301027
    Select Checkbox     myBusiness
    Input Text  id=empresa     Prestador Teste Automatizado  
    Click Element   id=idEspecialidade  
    Click Element   xpath=//*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]
    Press Keys    //*[@id="idEspecialidade"]/span/span[1]/span/ul/li[1]   Construção - Arquiteto+ENTER 
    Input Text  id=cep      09230590   
    Set Focus To Element  id=endereco    
    Input Text  id=numero   1300
    Set Focus To Element    id=complemento   
    Set Focus To Element   id=bairro   
    Set Focus To Element  id=cidade   
    Set Focus To Element  id=uf      
    Set Focus To Element  id=pais     
    Input Text  id=email    TesteAutomatico@teste.com   
    Input Text  id=celular      11911141115    
    Set Focus To Element  id=fone    
    Sleep   5
    Click Element    xpath=/html/body/app-root/app-create/app-app/div[2]/form/div/div[17]/button    
    Sleep   5 
    Wait Until Element Is Visible   xpath=/html/body/modal-container/div[2]/div/app-modal
    Page Should contain     Este CPF/CNPJ já está sendo usado!
    Click Element    xpath=/html/body/modal-container/div[2]/div/app-modal/div[1]/button
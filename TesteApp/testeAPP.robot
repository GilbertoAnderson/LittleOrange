*** Settings ****
Documentation   Swite Exemplo webTesting
Resource    resource.robot

*** Test Cases  ***
Caso Teste 01.00: Logar App - usuario correto
    Acessar pagina home do site 
    Clicar no botao Acessar
    Preencher Campo Email 
    Preencher Campo Password 
    Pressionar Entrar
    Fechar Navegador
    

Caso Teste 01.01: Logar App - usuario incorreto
    Acessar pagina home do site 
    Clicar no botao Acessar
    Preencher Campo Email Incorreto 
    Preencher Campo Password
    Pressionar Entrar
    Mensagem de Erro Login
    Fechar Navegador


Caso Teste 01.02: Logar App - senha incorreta
    Acessar pagina home do site 
    Clicar no botao Acessar
    Preencher Campo Email 
    Preencher Campo Password Incorreta
    Pressionar Entrar    
    Mensagem de Erro Login
    Fechar Navegador



Caso Teste 02.00: Esqueci a senha - botao Cancelar
    Acessar pagina home do site 
    Clicar no botao Acessar
    Clicar link Esqueceu Senha
    Preencher Campo Email 
    Clicar no botao Cancelar    
    Fechar Navegador



Caso Teste 02.01: Esqueci a senha - usuario incorreto
    Acessar pagina home do site 
    Clicar no botao Acessar
    Clicar link Esqueceu Senha
    Preencher Campo Email Incorreto 
    Clicar no botao Pesquisar
    Mensagem de Erro Nao Encontrado
    Fechar Navegador


Caso Teste 02.02: Esqueci a senha - processo completo
    Acessar pagina home do site 
    Clicar no botao Acessar
    Clicar link Esqueceu Senha    
    Preencher Campo Email 
    Clicar no botao Pesquisar
    Mensagem de Instrucoes Enviadas
    Fechar Navegador


Caso Teste 02.03: Esqueci a senha - tenta acessar com senha anterior
    Acessar pagina home do site 
    Clicar no botao Acessar
    Preencher Campo Email 
    Preencher Campo Password
    Pressionar Entrar    
    Mensagem de Erro Login
    Fechar Navegador


Caso Teste 02.04: Esqueci a senha - altera a senha
    Acessar pagina home do site 
    Clicar no botao Acessar
    Preencher Campo Email 
    Preencher Campo Nova Senha 
    Pressionar Entrar    
    Lista Condominios
    Menu Hamburguer
    Selecione Configuracoes
    Preenche Senhas  
    Ir para tela Inicial


Caso Teste 03.00: Nova Conta - novo usuario
    Acessar pagina home do site 
    Clicar no botao Acessar
    Ir para tela Inicial
    Clicar link Criar nova conta
    Preencher nova conta
    Fechar Navegador


Caso Teste 03.01: Nova Conta - novo condominio
    Adicionar Condominio
    Fechar Navegador


Caso Teste 03.02: Nova Conta - novo prestador
    Acessar pagina home do site 
    Clicar no botao Acessar
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    TesteAutomatico@teste.com
    Preencher Campo Password  
    Pressionar Entrar    
    Selecione Novo Prestador
    Adiciona Novo Prestador
    Fechar Navegador


Caso Teste 03.03: Nova Conta - prestador duplicado
    Acessar pagina home do site 
    Clicar no botao Acessar
    Wait Until Element Is Visible   id=email 
    Input Text  id=email    TesteAutomatico@teste.com
    Preencher Campo Password  
    Pressionar Entrar    
    Selecione Novo Prestador
    Adiciona Prestador Duplicado
    Fechar Navegador

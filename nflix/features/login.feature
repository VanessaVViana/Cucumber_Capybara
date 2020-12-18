#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catalogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

@login_happy
Cenario: Acesso
	Quando eu faco login com "vampira@viana.com" e "pwd123"
	E Clico no botao "Entrar"
    E devo ser autenticado
	Então sistema exibe "Vampira Viana" na área logada

@login_hapless
Esquema do Cenario: Login sem sucesso
    Quando eu faco login com <email> e <senha>
    E Clico no botao "Entrar"
    E nao devo ser autenticado
    Então Sistema exibe mensagem <texto>

    Exemplos:
    |   email               |   senha       |   texto                           |
    |   "vampira@viana.com" |   "abc123"    |   "Usuário e/ou senha inválidos"  |
    |   "abc@viana.com"     |   "pwd123"    |   "Usuário e/ou senha inválidos"  |
    |   "vampira@viana.com" |   ""          |   "Opps. Cadê a senha?"           |
    |   ""                  |   "pwd123"    |   "Opps. Cadê o email?"           |
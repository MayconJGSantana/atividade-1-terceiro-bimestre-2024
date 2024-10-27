programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util
	inclua biblioteca Matematica
	inclua biblioteca Calendario
	
	funcao inicio()
	{
		cadeia menu_opcoes[] = {"Entrar novos dados", "Seu nome em um livro/filme", "Sua 'Fake News'", "Seu nome no Dragon Ball", "Seu super poder bizarro", "Finalizar código"}
		inteiro opcao_menu
		
		inteiro dia_nascimento = 0
		inteiro mes_nascimento = 0
		inteiro posicao_primeira_letra_nome = 0
		inteiro ultimo_digito_ano_nascimento = 0


		entrada_dados_padrao(posicao_primeira_letra_nome, dia_nascimento, mes_nascimento, ultimo_digito_ano_nascimento)

		faca {
			faca_cabecalho_principal()
			pular_linha()
			
			fazer_menu(menu_opcoes)
			aguarde(500)
			pular_linha()
	
			opcao_menu = escolher_opcao(menu_opcoes)
			aguarde(500)
			limpa()
	
			faca_cabecalho_opcao(opcao_menu, menu_opcoes)
			pular_linha()

			consequencia_opcao(opcao_menu, posicao_primeira_letra_nome, dia_nascimento, mes_nascimento, ultimo_digito_ano_nascimento)
		} enquanto (opcao_menu != 6)
	}

	// Faz as divisórias
	funcao vazio espacos(inteiro quantidade_espacos) {
		// vai ser escrito "=" quantidade_espacos vezes
		para (inteiro i = 0; i < quantidade_espacos; i++) {
			escreva("=")
		}
		
		pular_linha()
	}

	// Pula linha
	funcao vazio pular_linha() {
		escreva("\n")
	}

	// Aguarda um tempo e escreve ...
	funcao vazio aguarde(inteiro tempo) {
		escreva("...")
		Util.aguarde(tempo)
	}

	// Faz as divisórias, mas com algo escrito
	funcao vazio tracos(cadeia enunciado, inteiro tamanho) {
		inteiro i
		inteiro caracteres_enunciado = Texto.numero_caracteres(enunciado)
		
		inteiro metade_caracteres_enunciado = Matematica.arredondar(caracteres_enunciado / 2, 0)
		inteiro metade_tamanho = Matematica.arredondar(tamanho / 2, 0)

		// escreve o traço até antes da metade do enunciado
		se (caracteres_enunciado % 2 == 0 e tamanho % 2 == 0) {
			para (i = 0; i < metade_tamanho - metade_caracteres_enunciado; i++) {
				escreva("=")
			}
		}
		senao se (caracteres_enunciado % 2 == 0 e tamanho % 2 == 1) {
			para (i = 0; i < metade_tamanho + 1 - metade_caracteres_enunciado; i++) {
				escreva("=")
			}
		}
		senao se (caracteres_enunciado % 2 == 1 e tamanho % 2 == 0) {
			para (i = 0; i < metade_tamanho - metade_caracteres_enunciado; i++) {
				escreva("=")
			}
			metade_tamanho--
		}
		senao {
			para (i = 0; i < metade_tamanho - metade_caracteres_enunciado; i++) {
				escreva("=")
			}
		}

		// escreve o enunciado
		escreva(enunciado)

		// escreve o restante da outra metade
		para (i = 0; i < metade_tamanho - metade_caracteres_enunciado; i++) {
			escreva("=")
		}
	}

	// Espera que o usuário responda sim (verdadeiro) ou não/nao (falso), caso não seja nenhum dos dois o usuário não "passa"
	funcao logico responde(cadeia enunciado) {
		cadeia deseja_continuar = ""
		logico resposta = falso
		
		enquanto (verdadeiro) {
			escreva("-> ", enunciado, " [sim/nao]? ")
			leia(deseja_continuar)
			deseja_continuar  = Texto.caixa_baixa(deseja_continuar)
	
			se (deseja_continuar == "sim") {
				resposta = verdadeiro
				pare
			}
			senao se (deseja_continuar == "nao" ou deseja_continuar == "não") {
				resposta = falso
				pare
			}
			senao {
				escreva("	* Valor inválido, tente novamente!")
				pular_linha()
			}
		}
		retorne resposta
	}

	// Faz o menu com os itens da lista
	funcao vazio fazer_menu(cadeia opcoes[]) {
		inteiro i
		inteiro posicao_humana
		
		para (i = 0; i < Util.numero_elementos(opcoes); i++) {
			posicao_humana = i + 1
			escreva("[ ", posicao_humana, " ]", " ", opcoes[i])
			pular_linha()
		}
	}

	// Pede para o usuário escolher um dos itens da lista
	funcao inteiro escolher_opcao(cadeia opcoes[]) {
		inteiro opcao = 0
		
		enquanto (verdadeiro) {
			escreva("-> Escolha uma opção: ")
			leia(opcao)
			se (opcao < 1 ou opcao > Util.numero_elementos(opcoes)) {
				escreva("Valor inválido, tente novamente!")
				pular_linha()
			}
			senao {
				pare
			}
		}
		retorne opcao
	}

	// Faz a divisória com a opção escrita
	funcao vazio faca_cabecalho_opcao(inteiro opcao, cadeia opcoes[]) {
		tracos(opcoes[opcao - 1], 40)
	}

	// Faz a divisória com "Exercício 9" escrito
	funcao vazio faca_cabecalho_principal() {
		tracos("Exercício 9", 40)
	}



	// Pede para o usuário os dados necessários para fazer os enunciados
	funcao vazio entre_dados(inteiro &posicao_primeira_letra_nome, inteiro &dia_nascimento, inteiro &mes_nascimento, inteiro &ultimo_digito_ano_nascimento) {
		posicao_primeira_letra_nome = entrada_posicao_primeiro_caracter_nome()

		dia_nascimento = entrada_dia()
		
		mes_nascimento = entrada_mes()

		ultimo_digito_ano_nascimento = entrada_ultimo_digito_ano()
	}

	// Pede, pela primeira vez, para o usuário os dados necessários para fazer os enunciados
	funcao vazio entrada_dados_padrao(inteiro &posicao_primeira_letra_nome, inteiro &dia_nascimento, inteiro &mes_nascimento, inteiro &ultimo_digito_ano_nascimento) {
		faca_cabecalho_principal()
		pular_linha()

		entre_dados(posicao_primeira_letra_nome, dia_nascimento, mes_nascimento, ultimo_digito_ano_nascimento)

		espacos(40)
		aguarde(1500)
		limpa()
	}

	// Define o nome para o usuário se ele fosse um filme/livro
	funcao cadeia nome_livro_filme(inteiro ultimo_digito_ano_nascimento, inteiro mes_nascimento, inteiro primeira_letra_nome) {
		cadeia enunciado_primeira_letra[] = {"A verdadeira ", "A excitante ", "A alegre ", "A horripilante ", "A fatal", "A apaixonante ", "A trágica ", "A sangrenta ", "A famosa ", "A grande ", "A penosa ", "A triste ", "A desastrosa ", "A formosa ", "A obscura ", "A gloriosa", "A infeliz ", "A emocionante ", "A fantástica ", "A terrível ", "A aborrecida ", "A incrível ", "A desgraçada ", "A lamentável ", "A cômica ", "A miserável "}
		cadeia enunciado_mes_nascimento[] = {"façanha ", "promessa ", "batalha ", "existência ", "vida ", "missão ", "vingança ", "luta ", "mudança ", "lenda ", "história ", "biografia "}
		cadeia enunciado_ano_nascimento[] = {"de uma mente.", "de um glorioso (a).", "de um sonhador (a).", "de um crente.", "de um peregrino(a).", "de um propósito.", "de um corajoso(a).", "de um amor não correspondido.", "de uma fé.", "de um destino."}
		cadeia enunciado

		escreva("Digito ano: ", ultimo_digito_ano_nascimento, " Mes: ", mes_nascimento, "Digito nome: ", primeira_letra_nome)

		enunciado = enunciado_primeira_letra[primeira_letra_nome]
		enunciado += enunciado_mes_nascimento[mes_nascimento - 1]
		enunciado += enunciado_ano_nascimento[ultimo_digito_ano_nascimento]
		
		retorne enunciado
	}

	// Define o nome para o usuário se ele fosse uma fake news
	funcao cadeia nome_fake_news(inteiro dia_nascimento, inteiro mes_nascimento, inteiro posicao_primeira_letra_nome) {
		cadeia enunciado_primeira_letra[] = {"Água com limão ", "Bacon ", "Cúrcuma ", "Doce de leite ", "Azeite ", "Frango ", "Gengibre ", "Adoçantes ", "Açúcar ", "Jiló ", "Cravo ", "Leite ", "Macarrão ", "Leite ", "Ovo ", "Pizza ", "Óleo de coco ", "Rabanada ", "Suco Detox ", "Sal rosa ", "Glutamina ", "Doce low carb ", "Whey protein ", "Própolis ", "Comida japonesa ", "Peixe "}
		cadeia enunciado_mes_nascimento[] = {"ao acordar ", "como pré-treino ", "injetável ", "no cabelo ", "em jejum ", "de 3 em 3 horas ", "no chá ", "no café ", "depois das 18:00 ", "como pós-treino ", "no almoço ", "antes de dormir "}
		cadeia enunciado_dia_nascimento[] = {"diminui inchaço.", "previne infarto.", "cura TPM.", "emagrece.", "diminui vontade de doce.", "mata.", "limpa o fígado.", "remove todas as toxinas.", "previne diabetes.", "cura dores de cabeça.", "causa depressão.", "vicia.", "elimina barriga.", "te deixa mais bonito(a).", "acaba com dores nas costas.", "faz o cabelo crescer.", "diminui estresse.", "combate a gripe.", "remove espinhas.", "elimina olheiras.", "deixa mais inteligente.", "aumenta a altura.", "rejuvenesce.", "engorda.", "emburrece.", "elimina indisposição.", "limpa as artérias.", "ajuda na predisposição de alzheimer."} 
		cadeia enunciado

		enunciado = enunciado_primeira_letra[posicao_primeira_letra_nome] 
		enunciado += enunciado_mes_nascimento[mes_nascimento - 1]
		enunciado += enunciado_dia_nascimento[dia_nascimento - 1]

		retorne enunciado
	}

	// Define o nome para o usuário se ele estivesse em Dragon Ball
	funcao cadeia nome_dragon_ball(inteiro mes_nascimento, inteiro dia_nascimento) {
		cadeia enunciado_mes_nascimento[] = {"Demônio ", "Sayajin ", "Fusão ", "Namekuseijin ", "Kami-Sama ", "Mestre ", "Deus ", "Kaioshin ", "Androide ", "Dragão ", "Anjo ", "Makin "}
		cadeia enunciado_dia_nascimento[] = {"do submundo.", "do tempo.", "dos céus.", "de namekusei.", "do futuro.", "do dragão.", "do universo."} 
		cadeia enunciado

		enunciado = enunciado_mes_nascimento[mes_nascimento - 1]
		enunciado += defina_enunciado_dia_nascimento_dragon_ball(enunciado_dia_nascimento, dia_nascimento)

		retorne enunciado
	}

	// Define o nome para o usuário se ele tivesse um super poder
	funcao cadeia nome_super_poder_bizarro(inteiro dia_nascimento, inteiro mes_nascimento, inteiro posicao_primeira_letra_nome) {
		cadeia enunciado_primeira_letra[] = {"Dobrar ", "Abraçar ", "Pular ", "Levitar ", "Transformar ", "Comer ", "Agarrar ", "Disparar ", "Desintegrar ", "Seduzir ", "Estalar ", "Comunicar-se com ", "Controlar ", "Guardar ", "Cortar ", "Morder ", "Levantar ", "Criar ", "Atrair ", "Hipnotizar ", "Equilibrar ", "Ressuscitar ", "Congelar ", "Compreender ", "Cuspir "}
		cadeia enunciado_dia_nascimento[] = {"gelatina ", "ovelhas ", "vacas ", "miojo ", "macarrão ", "jogos ", "pombos ", "meias ", "camisas ", "lava ", "luzes de natal ", "sanduíches ", "árvores ", "dinheiro ", "creepers ", "porcos ", "cavalos ", "maçãs douradas ", "espadas ", "terra ", "pizza ", "sorvete ", "cangurus ", "hambúrgueres ", "água ", "bolo ", "calça ", "diamantes ", "esmeraldas ", "ouro "} 
		cadeia enunciado_mes_nascimento[] = {"com a mente.", "dormindo.", "com os dentes.", "com a cara.", "com as orelhas.", "com a cara.", "com a boca.", "com o nariz.", "com os pés.", "com a pança.", "voando.", "nadando."}
		cadeia enunciado

		enunciado = enunciado_primeira_letra[posicao_primeira_letra_nome]
		enunciado += enunciado_dia_nascimento[dia_nascimento - 1]
		enunciado += enunciado_mes_nascimento[mes_nascimento - 1]

		retorne enunciado
	}

	// Espera o usuário entrar com o nome, e pega o primeiro caracter
	funcao inteiro entrada_posicao_primeiro_caracter_nome() {
		cadeia nome
		cadeia primeira_letra_nome
		inteiro posicao_primeira_letra_nome
		
		escreva("-> Entre com seu primeiro nome: ")
		leia(nome)
		nome = Texto.substituir(nome, " ", "")
		nome = Texto.caixa_baixa(nome)
		
		primeira_letra_nome = Tipos.caracter_para_cadeia(Texto.obter_caracter(nome, 0))
		posicao_primeira_letra_nome = posicao_letra(primeira_letra_nome)

		retorne posicao_primeira_letra_nome
	}

	// Espera o usuário entrar com o dia de nascimento
	funcao inteiro entrada_dia() {
		inteiro dia_nascimento

		faca {
			escreva("-> Entre com o dia que nasceste: ")
			leia(dia_nascimento)

			// Valida o dia de nascimento
			se (dia_nascimento < 1 ou dia_nascimento > 31) {
				escreva("	* Valor inválido, tente novamente!")
				pular_linha()
			}
			senao {
				pare
			}
		} enquanto (verdadeiro)

		retorne dia_nascimento
	}

	// Espera o usuário entrar com o mês de nascimento
	funcao inteiro entrada_mes() {
		inteiro mes_nascimento

		faca {
			escreva("-> Entre com o mês de nascimento: ")
			leia(mes_nascimento)

			// Mês de nascimento válido?
			se (mes_nascimento < 1 ou mes_nascimento > 12) {
				escreva("	* Valor inválido, tente novamente!")
				pular_linha()
			}
			senao {
				pare
			}
			
		} enquanto (verdadeiro)

		retorne mes_nascimento
	}

	// Espera o usuário entrar com o ano de nascimento e pega o último digito
	funcao inteiro entrada_ultimo_digito_ano() {
		inteiro ano_nascimento
		inteiro ultimo_digito_ano_nascimento
		
		escreva("-> Entre com o ano de nascimento: ")
		leia(ano_nascimento)
		
		ultimo_digito_ano_nascimento = ano_nascimento % 10

		retorne ultimo_digito_ano_nascimento
	}

	// Já que o enunciado com referência ao dia de nascimento do Dragon Ball tem palavras repetidas,
	// eu preferi usar um se, senao se e senao para saber qual era o dia de nascimento, ao invés
	// de repetir na lista os valores
	funcao cadeia defina_enunciado_dia_nascimento_dragon_ball(cadeia enunciado_dia_nascimento[], inteiro dia_nascimento) {
		cadeia enunciado = ""
		
		se (dia_nascimento >= 1 e dia_nascimento <= 4) {
			enunciado = enunciado_dia_nascimento[0]
		}
		senao se (dia_nascimento >= 5 e dia_nascimento <= 8) {
			enunciado = enunciado_dia_nascimento[1]
		}
		senao se (dia_nascimento >= 9 e dia_nascimento <= 13) {
			enunciado = enunciado_dia_nascimento[2]
		}
		senao se (dia_nascimento >= 14 e dia_nascimento <= 17) {
			enunciado = enunciado_dia_nascimento[3]
		}
		senao se (dia_nascimento >= 18 e dia_nascimento <= 22) {
			enunciado = enunciado_dia_nascimento[4]
		}
		senao se (dia_nascimento >= 23 e dia_nascimento <= 27) {
			enunciado = enunciado_dia_nascimento[5]
		}
		senao {
			enunciado = enunciado_dia_nascimento[6]
		}

		retorne enunciado
	}

	// faz a consequência da opção escolhida pelo usuário
	funcao vazio consequencia_opcao(inteiro opcao_escolhida, inteiro &posicao_primeira_letra_nome, inteiro &dia_nascimento, inteiro &mes_nascimento, inteiro &ultimo_digito_ano_nascimento) {
		cadeia enunciado
		logico voltar_menu = falso
		
		se (opcao_escolhida != 6) {
			se (opcao_escolhida == 1) {
				entre_dados(posicao_primeira_letra_nome, dia_nascimento, mes_nascimento, ultimo_digito_ano_nascimento)
			}
			senao se (opcao_escolhida == 2) {
				enunciado = nome_livro_filme(ultimo_digito_ano_nascimento, mes_nascimento, posicao_primeira_letra_nome)
				escreva("# ", enunciado)
				pular_linha()
			}
			senao se (opcao_escolhida == 3) {
				enunciado = nome_fake_news(dia_nascimento, mes_nascimento, posicao_primeira_letra_nome)
				escreva("# ", enunciado)
				pular_linha()
			}
			senao se (opcao_escolhida == 4) {
				enunciado = nome_dragon_ball(mes_nascimento, dia_nascimento)
				escreva("# ", enunciado)
				pular_linha()
			}
			senao se (opcao_escolhida == 5) {
				enunciado = nome_super_poder_bizarro(dia_nascimento, mes_nascimento, posicao_primeira_letra_nome)
				escreva("# ", enunciado)
				pular_linha()
			}

			espacos(40)
			aguarde(500)
			pular_linha()
			
			faca {
				voltar_menu = responde("Desejas voltar ao menu")
			} enquanto (nao voltar_menu)
			limpa()
		}
		senao {
			escreva("Que pena que tens de ir :(")
			pular_linha()
			espacos(40)
		}
	}

	// descobre a posiçõo do alfabeto - 1 de uma letra
	funcao inteiro posicao_letra(cadeia letra) {
		inteiro i
		cadeia alfabeto[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
		inteiro posicao = 0

		para (i = 0; i < Util.numero_elementos(alfabeto); i++) {
			se (alfabeto[i] == letra) {
				posicao = i
				pare
			}
		}
		retorne posicao
	}

	// arredonda um número real para cima
	funcao vazio arredondar_para_cima(real &numero_real) {
		cadeia numero_cadeia = Tipos.real_para_cadeia(numero_real)
		inteiro posicao_ponto = Texto.posicao_texto(".", numero_cadeia, 0)
		caracter caracter_depois_ponto = Texto.obter_caracter(numero_cadeia, posicao_ponto + 1)
		
		se (caracter_depois_ponto != '0') {
			numero_real++
		}
	}
}

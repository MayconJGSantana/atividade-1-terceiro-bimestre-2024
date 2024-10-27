programa
{
	inclua biblioteca Util
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio()
	{
		inteiro numeros[10]
		cadeia opcoes_menu[] = {"Entrar novos números", "Mostrar lista", "Números pares", "Sair"}
		inteiro opcao_escolhida
		
		cabecalho_principal()
		pula_linha()
		receba_lista(numeros)
		tracos("", 40)
		pula_linha()
		aguarda(1000)
		limpa()

		faca {
			cabecalho_principal()
			pula_linha()

			faz_menu(opcoes_menu)
			tracos("", 40)
			pula_linha()
			aguarda(1000)
			pula_linha()

			opcao_escolhida = escolha_opcao(opcoes_menu)
			aguarda(1000)
			limpa()

			cabecalho_secundario(opcao_escolhida, opcoes_menu)
			pula_linha()

			consequencia_menu(numeros, opcao_escolhida)
		} enquanto (opcao_escolhida != 4)
		
	}
	// Faz um menu
	funcao vazio faz_menu(cadeia opcoes[]) {
		inteiro i
		inteiro posicao_humana
		
		para (i = 0; i < Util.numero_elementos(opcoes); i++) {
			posicao_humana = i + 1
			escreva("[ ", posicao_humana, " ]", " ", opcoes[i])
			pula_linha()
		}
	}

	// Recebe uma opção do menu
	funcao inteiro escolha_opcao(cadeia opcoes[]) {
		inteiro opcao = 0
		
		enquanto (verdadeiro) {
			escreva("-> Escolha uma opção: ")
			leia(opcao)
			se (opcao < 1 ou opcao > Util.numero_elementos(opcoes)) {
				escreva("Valor inválido, tente novamente!")
				pula_linha()
			}
			senao {
				pare
			}
		}
		retorne opcao
	}

	// Mostra uma lista
	funcao vazio mostra_lista(inteiro lista[]) {
		inteiro i

		escreva("Lista com os números: ")
		pula_linha()
		para (i = 0; i < Util.numero_elementos(lista); i++) {
			escreva("	# ", i + 1, "° posição: ", lista[i], "\n")
		}
	}
	
	// Pula uma linha
	funcao vazio pula_linha() {
		escreva("\n")
	}

	funcao vazio cabecalho_principal() {
		cadeia enunciado = "Exercício 4"

		tracos(enunciado, 40)
	}
	
	funcao vazio cabecalho_secundario(inteiro opcao_escolhida, cadeia opcoes[]) {
		inteiro indice_opcao_escolhida = opcao_escolhida - 1
		cadeia enunciado = opcoes[indice_opcao_escolhida]

		tracos(enunciado, 40)
	}

	funcao logico responda(cadeia enunciado) {
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
				escreva("Valor inválido, tente novamente!")
				pula_linha()
			}
		}
		retorne resposta
	}

	// Aguarda um tempo e escreve "..." para dar mais imersão
	funcao vazio aguarda(inteiro tempo) {
		escreva("...")
		Util.aguarde(tempo)
	}

	// Faz divisórias com um nome escrito
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

	// Faz uma pergunta ao usuário
	funcao vazio pergunta(cadeia enunciado) {
		escreva("-> ", enunciado)
	}



	// Faz a escolha que o usuário fez
	funcao vazio consequencia_menu(inteiro &lista[], inteiro opcao_menu) {
		logico voltar_menu
		
		se (opcao_menu == 4) {
			escreva("Que pena que tens de ir embora :(")
			
			pula_linha()
			tracos("", 40)
		}
		senao {
			se (opcao_menu == 1) {
				receba_lista(lista)
			}
			senao se (opcao_menu == 2) {
				mostra_lista(lista)
			}
			senao {
				mostra_pares(lista)
			}
			
			tracos("", 40)
			pula_linha()
			aguarda(1000)
			pula_linha()

			faca {
				voltar_menu = responda("Queres voltar para o menu")
			} enquanto (nao voltar_menu)

			limpa()
		}
	}
	
	// Mostra os números pares e a posição
	funcao vazio mostra_pares(inteiro &numeros[]) {
		inteiro i
		
		escreva("Números pares:")
		pula_linha()
		para (i = 0; i < Util.numero_elementos(numeros); i++) {
			se (numeros[i] % 2 == 0) {
				escreva("	Índice: ", i, " || ", i + 1, " - ", "Número: ", numeros[i])
				pula_linha() 
			}
		}
	}

	// Recebe os números que o usuário entrar
	funcao vazio receba_lista(inteiro &numeros[]) {
		inteiro i
		cadeia enunciado
		
		para (i = 0; i < Util.numero_elementos(numeros); i++) {
			enunciado = "Entre com o " + (i + 1) + "° número: "
			pergunta(enunciado)
			leia(numeros[i])
		}
	}
}

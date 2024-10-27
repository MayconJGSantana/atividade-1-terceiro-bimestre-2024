programa
{
	inclua biblioteca Util
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio()
	{
		inteiro i
		inteiro numeros_sorteados[30]
		cadeia menu_opcoes[] = {"Fazer nova lista", "Mostrar lista", "Números repetidos", "Sair"}
		inteiro opcao_escolhida

		sorteia_lista(numeros_sorteados)

		faca {
			cabecalho_principal()
			pula_linha()

			faz_menu(menu_opcoes)
			tracos("", 40)
			pula_linha()
			aguarda(1000)
			pula_linha()

			opcao_escolhida = escolha_opcao(menu_opcoes)

			limpa()

			cabecalho_secundario(opcao_escolhida, menu_opcoes)
			pula_linha()

			consequencia_menu(numeros_sorteados, opcao_escolhida)
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
		cadeia enunciado = "Exercício 6"

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



	// Faz a escolha que o usuário fez
	funcao vazio consequencia_menu(inteiro &numeros_sorteados[], inteiro opcao_menu) {
		logico voltar_menu
		
		se (opcao_menu == 4) {
			escreva("Que pena que tens de ir embora :(")
			
			pula_linha()
			tracos("", 40)
		}
		senao {
			se (opcao_menu == 1) {
				sorteia_lista(numeros_sorteados)
				escreva("Lista refeita com sucesso!")
				pula_linha()
			}
			senao se (opcao_menu == 2) {
				mostra_lista(numeros_sorteados)
			}
			senao {
				mostra_numeros_repetidos(numeros_sorteados)
				pula_linha()
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

	// Sorteia números para colocar em uma lista
	funcao vazio sorteia_lista(inteiro &lista[]) {
		inteiro i
		inteiro numero_sorteado
		
		para (i = 0; i < Util.numero_elementos(lista); i++) {
			numero_sorteado = Util.sorteia(1, 15)
			lista[i] = numero_sorteado
		}
	}

	// Mostra quantas vezes um número que o usuário entrou foi repetido
	funcao vazio mostra_numeros_repetidos(inteiro numeros_sorteados[]) {
		inteiro chave
		inteiro quantidade_vezes_repetidas = 0
		inteiro i
		
		faca {
			escreva("-> Entre com a chave com o fim de sabe a quantidade de vezes de sua repetição: ")
			leia(chave)
			se (chave < 1 ou chave > 15) {
				escreva("	# Valor inválido, tente novamente!\n")
			}
			senao {
				pare
			}
		} enquanto (verdadeiro)

		para (i = 0; i < Util.numero_elementos(numeros_sorteados); i++) {
			se (chave == numeros_sorteados[i]) {
				quantidade_vezes_repetidas++
			}
		}

		escreva("* Repetiu ", quantidade_vezes_repetidas, " vezes")
	}
}

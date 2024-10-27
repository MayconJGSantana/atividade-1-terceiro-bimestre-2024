programa
{
	inclua biblioteca Util
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio()
	{
		inteiro listadeImpares[5]
		inteiro listadePares[5]
		inteiro intercalados[10]
		cadeia opcoes_menu[] = {"Letra A", "Letra B", "Letra C", "Letra D", "Sair"}
		inteiro opcao_escolhida
		logico intercalou = falso

		receba_dados_iniciais(listadeImpares, listadePares)
		intercala_listas(listadeImpares, listadePares, intercalados)
		
		faca {
			cabecalho_principal()
			pula_linha()
			
			faca_menu(opcoes_menu)
			tracos("", 40)
			pula_linha()
			aguarda(1000)
			pula_linha()

			opcao_escolhida = escolha_opcao(opcoes_menu)
			aguarda(1000)
			limpa()
			
			cabecalho_secundario(opcao_escolhida, opcoes_menu)
			pula_linha()

			consequencia_menu(opcao_escolhida, listadeImpares, listadePares, intercalados, intercalou)
		} enquanto (opcao_escolhida != 5)
	}

	funcao vazio faca_menu(cadeia opcoes[]) {
		inteiro i
		inteiro posicao_humana
		
		para (i = 0; i < Util.numero_elementos(opcoes); i++) {
			posicao_humana = i + 1
			escreva("[ ", posicao_humana, " ]", " ", opcoes[i])
			pula_linha()
		}
	}

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
	
	funcao vazio pula_linha() {
		escreva("\n")
	}

	funcao vazio pergunta(cadeia enunciado) {
		escreva("-> ", enunciado)
	}

	funcao vazio cabecalho_principal() {
		cadeia enunciado = "Exercício 7"

		tracos(enunciado, 40)
	}

	funcao vazio cabecalho_secundario(inteiro opcao_escolhida, cadeia opcoes[]) {
		inteiro indice_opcao_escolhida = opcao_escolhida - 1
		cadeia enunciado = opcoes[indice_opcao_escolhida]

		tracos(enunciado, 40)
	}

	// Mostra uma lista
	funcao vazio mostra_lista(inteiro lista[]) {
		inteiro i

		escreva("Lista com os números intercalados: ")
		pula_linha()
		para (i = 0; i < Util.numero_elementos(lista); i++) {
			escreva("	# ", i + 1, "° posição: ", lista[i], "\n")
		}
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

	// Aguarda um tempo e escreve "..." para dar mais imersão
	funcao vazio aguarda(inteiro tempo) {
		escreva("...")
		Util.aguarde(tempo)
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
	


	// Faz a escolha que o usuário fez
	funcao vazio consequencia_menu(inteiro opcao_menu, inteiro &numeros_impares[], inteiro &numeros_pares[], inteiro &intercalados[], logico &intercalou) {
		logico voltar_menu
		
		se (opcao_menu == 5) {
			escreva("Que pena que tens de ir embora :(")
			
			pula_linha()
			tracos("", 40)
		}
		senao {
			se (opcao_menu == 1) {
				receba_impares(numeros_impares)
				intercalou = verdadeiro
			}
			senao se (opcao_menu == 2) {
				receba_pares(numeros_pares)
				intercalou = verdadeiro
			}
			senao se (opcao_menu == 3) {
				intercala_listas(numeros_impares, numeros_pares, intercalados)
				escreva("Lista intercalada com sucesso!")
				pula_linha()
			}
			senao {
				se (intercalou) {
					escreva("-> Essa é a lista antiga, mudaste uma das lista e não intercalaste.")
					pula_linha()
				}
				
				mostra_lista(intercalados)
				intercalou = falso
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

	// Recebe valors unicamente impares e coloca em uma lista
	funcao vazio receba_impares(inteiro &numeros_impares[]) {
		inteiro i
		cadeia enunciado
		
		para (i = 0; i < Util.numero_elementos(numeros_impares); i++) {
			faca {
				enunciado = "Entre com o " + (i + 1) + "° número impar: "
				pergunta(enunciado)
				leia(numeros_impares[i])
				se (numeros_impares[i] % 2 == 0) {
					escreva("	Valor inválido, tente novamente!\n")
				}
				senao {
					pare
				}
			} enquanto (verdadeiro)
		}
	}
	
	// Recebe valors unicamente pares e coloca em uma lista
	funcao vazio receba_pares(inteiro &numeros_pares[]) {
		inteiro i
		
		para (i = 0; i < Util.numero_elementos(numeros_pares); i++) {
			faca {
				escreva("-> Entre com um número pares: ")
				leia(numeros_pares[i])
				se (numeros_pares[i] % 2 == 1) {
					escreva("	Valor inválido, tente novamente!\n")
				}
				senao {
					pare
				}
			} enquanto (verdadeiro)
		}
	}

	// Entra em uma lista com números de outras duas, intercalando
	funcao vazio intercala_listas(inteiro primeira_lista[], inteiro segunda_lista[], inteiro &lista_destinataria[]) {
		inteiro i
		
		para (i = 0; i < (Util.numero_elementos(lista_destinataria) / 2); i++) {
			lista_destinataria[2 * i] = primeira_lista[i]
			lista_destinataria[1 + 2 * i] = segunda_lista[i]
		}
	}

	funcao vazio receba_dados_iniciais(inteiro &numeros_impares[], inteiro &numeros_pares[]) {
		cabecalho_principal()
		pula_linha()

		receba_impares(numeros_impares)
		aguarda(1000)
		pula_linha()
		
		receba_pares(numeros_pares)

		tracos("", 40)
		pula_linha()
		aguarda(1000)

		limpa()
	}

}

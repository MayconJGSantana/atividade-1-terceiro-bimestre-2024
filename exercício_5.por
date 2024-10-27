programa
{
	inclua biblioteca Util
	inclua biblioteca Texto
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		inteiro numeros_sorteados[10]
		cadeia opcoes_menu[] = {"Sortear nova lista", "Mostrar lista", "Sair"}
		inteiro opcao_escolhida

		sorteia_lista(numeros_sorteados)

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
			
			consequencia_menu(numeros_sorteados, opcao_escolhida)
		} enquanto (opcao_escolhida != 3)

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
		cadeia enunciado = "Exercício 5"

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
	funcao vazio consequencia_menu(inteiro &lista[], inteiro opcao_menu) {
		logico voltar_menu
		
		se (opcao_menu == 3) {
			escreva("Que pena que tens de ir embora :(")
			
			pula_linha()
			tracos("", 40)
		}
		senao {
			se (opcao_menu == 1) {
				sorteia_lista(lista)
				escreva("Lista refeita com sucesso!")
				pula_linha()
			}
			senao {
				mostra_lista(lista)
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

	funcao logico numero_repetido(inteiro numeros[], inteiro numero) {
		inteiro i
		logico numero_repetiu = falso
		
		para (i = 0; i < Util.numero_elementos(numeros); i++) {
			se (numeros[i] == numero) {
				numero_repetiu = verdadeiro
				pare
			}
		}
		retorne numero_repetiu
	}

	funcao vazio sorteia_lista(inteiro &numeros_sorteados[]) {
		inteiro i
		inteiro numero_aleatorio
		
		para (i = 0; i < Util.numero_elementos(numeros_sorteados); i++) {
			faca {
				numero_aleatorio = Util.sorteia(1, 100)
			} enquanto (numero_repetido(numeros_sorteados, numero_aleatorio))
			numeros_sorteados[i] = numero_aleatorio
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 266; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numeros_sorteados, 7, 10, 17};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */

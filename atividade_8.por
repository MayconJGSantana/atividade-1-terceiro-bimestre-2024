programa {
	inclua biblioteca Texto
	inclua biblioteca Matematica
	inclua biblioteca Util
	
	funcao inicio() {
		inteiro numeros_escolhidos[3][5]
		
		tracos("", 40)
		pular_linha()
		
		escreva("	Entre com 15 números a fim de", "\n",
			"saber quais deles são pares, e quais são")
		pular_linha()
		pular_linha()
		
		tracos("Exercício 8", 40)
		pular_linha()
		
		recebe_numeros(numeros_escolhidos)
		
		tracos("", 40)
		pular_linha()
		
		aguarde(1500)
		limpa()

		
		faca_exercicio(numeros_escolhidos)

	}
	
	funcao vazio pular_linha() {
		escreva("\n")
	}
	
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

	funcao vazio faca_exercicio(inteiro numeros_escolhidos[][]) {
		tracos("Exercício 8", 40)
		pular_linha()
		
		escreve_matriz(numeros_escolhidos)

		aguarde(1500)
		pular_linha()
		mostre_pares(numeros_escolhidos)
	}
	
	funcao vazio pergunte(cadeia enunciado) {
		escreva("-> ", enunciado, ": ")
	}
	
	funcao vazio aguarde(inteiro tempo) {
		escreva("...")
		Util.aguarde(tempo)
	}

	funcao vazio recebe_numeros(inteiro numeros_escolhidos[][]) {
		inteiro numero
		inteiro i
		inteiro j
		cadeia enunciado

		para (i = 0; i < Util.numero_linhas(numeros_escolhidos); i++) {
			para (j = 0; j < Util.numero_colunas(numeros_escolhidos); j++) {
				enunciado = "Entre com o " + (i * 5 + 1 + j) + "° número"
				pergunte(enunciado)
				leia(numero)
				numeros_escolhidos[i][j] = numero
			}
		}
	}

	// Escreve uma matriz inteira
	funcao vazio escreve_matriz(inteiro matriz[][]) {
		inteiro linha
		inteiro coluna

		escreva("A matriz deu em: ")
		pular_linha()
		para (linha = 0; linha < Util.numero_linhas(matriz); linha++) {
			escreva("	")
			para (coluna = 0; coluna < Util.numero_colunas(matriz); coluna++) {
				escreva(matriz[linha][coluna], " ")
			}

			pular_linha()			
		}
	}

	funcao vazio mostre_pares(inteiro numeros_escolhidos[][]) {
		inteiro i
		inteiro j

		escreva("Os número pares são: ")
		pular_linha()
		para (i = 0; i < Util.numero_linhas(numeros_escolhidos); i++) {
			para (j = 0; j < Util.numero_colunas(numeros_escolhidos); j++) {
				se (numeros_escolhidos[i][j] % 2 == 0) {
					escreva("	# Na linha ", i, " e coluna ", j, " há um número par, ", numeros_escolhidos[i][j])
					pular_linha()
				}
			}
		}
	}
}

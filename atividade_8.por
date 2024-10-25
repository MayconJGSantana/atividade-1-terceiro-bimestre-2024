programa {
	
	inclua biblioteca Util
	
	funcao inicio() {
		faca_exercicio()
	}

	funcao vazio faca_exercicio() {
		inteiro numeros_escolhidos[3][5]

		recebe_numeros(numeros_escolhidos)

		mostre_pares(numeros_escolhidos)
	}

	funcao vazio recebe_numeros(inteiro numeros_escolhidos[][]) {
		inteiro numero
		inteiro i
		inteiro j

		para (i = 0; i < Util.numero_linhas(numeros_escolhidos); i++) {
			para (j = 0; j < Util.numero_colunas(numeros_escolhidos); j++) {
				escreva("-> Entre com um número: ")
				leia(numero)
				numeros_escolhidos[i][j] = numero
			}
		}
	}

	funcao vazio mostre_pares(inteiro numeros_escolhidos[][]) {
		inteiro i
		inteiro j
		
		para (i = 0; i < Util.numero_linhas(numeros_escolhidos); i++) {
			para (j = 0; j < Util.numero_colunas(numeros_escolhidos); j++) {
				se (numeros_escolhidos[i][j] % 2 == 0) {
					escreva("Na linha ", i, " e coluna ", j, " há um número par, ", numeros_escolhidos[i][j], "\n")
				}
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 60; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
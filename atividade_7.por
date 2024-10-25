programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
		inteiro listadeImpares[5]
		inteiro listadePares[5]
		inteiro intercalados[10]
		inteiro numero
		inteiro i

		// letra a
		para (i = 0; i < Util.numero_elementos(listadeImpares); i++) {
			faca {
				escreva("-> Entre com um número impar: ")
				leia(numero)
				se (numero % 2 == 0) {
					escreva("Valor inválido, tente novamente!\n")
				}
				senao {
					pare
				}
			} enquanto (verdadeiro)
		}

		// letra b
		para (i = 0; i < Util.numero_elementos(listadePares); i++) {
			faca {
				escreva("-> Entre com um número pares: ")
				leia(numero)
				se (numero % 2 == 1) {
					escreva("Valor inválido, tente novamente!\n")
				}
				senao {
					pare
				}
			} enquanto (verdadeiro)
		}

		//letra c
		para (i = 0; i < (Util.numero_elementos(intercalados) / 2); i++) {
			intercalados[i] = listadePares[i]
			intercalados[i + 1] = listadeImpares[i]
		}

		//letra d
		mostra_lista(intercalados)
	}

	funcao vazio mostra_lista(inteiro lista[]) {
		inteiro i

		para (i = 0; i < Util.numero_elementos(lista); i++) {
			escreva(lista[i], "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 635; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
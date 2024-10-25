programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
		inteiro i
		inteiro numeros_sorteados[30]
		inteiro numero_sorteado
		inteiro chave
		inteiro quantidade_vezes_repetidas = 0
		
		para (i = 0; i < Util.numero_elementos(numeros_sorteados); i++) {
			numero_sorteado = Util.sorteia(1, 15)
			numeros_sorteados[i] = numero_sorteado
		}

		faca {
			escreva("-> Entre com a chave com o fim de sabe a quantidade de vezes de sua repetição: ")
			leia(chave)
			se (chave < 1 ou chave > 15) {
				escreva("Valor inválido, tente novamente!\n")
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

		escreva("Repetiu ", quantidade_vezes_repetidas, " vezes")
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
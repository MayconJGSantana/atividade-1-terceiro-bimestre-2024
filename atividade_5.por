programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
		inteiro numeros_sorteados[10]
		inteiro i
		inteiro j
		inteiro numero_aleatorio

		para (i = 0; i < Util.numero_elementos(numeros_sorteados); i++) {
			faca {
				numero_aleatorio = Util.sorteia(1, 100)
			} enquanto (numero_repetido(numeros_sorteados, numero_aleatorio))
			numeros_sorteados[i] = numero_aleatorio
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
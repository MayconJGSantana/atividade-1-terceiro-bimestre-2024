programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
		inteiro i
		inteiro numeros[10]
		
		para (i = 0; i < Util.numero_elementos(numeros); i++) {
			escreva("-> Entre com um número: ")
			leia(numeros[i])
		}

		escreva("Números pares:", "\n")
		para (i = 0; i < Util.numero_elementos(numeros); i++) {
			se (numeros[i] % 2 == 0) {
				escreva("Índice: ", i, " Índice de compreensão humana: ", i + 1, " - ", "Número: ", numeros[i], "\n") 
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 244; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
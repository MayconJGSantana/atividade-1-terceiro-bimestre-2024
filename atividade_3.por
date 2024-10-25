programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
		real notas[4]
		inteiro i
		real media

		para (i = 0; i < Util.numero_elementos(notas); i++) {
			valida_nota(notas, i)
		}
		media = faz_media(notas)
		escreva("Média: ", media)
		
	}

	funcao vazio valida_nota(real &notas[], inteiro i) {
		real nota
		
		enquanto (verdadeiro) {
			escreva("-> Entre com uma nota: ")
			leia(nota)
			se (nota < 0 ou nota > 100) {
				escreva("Valor inválido, tente novamente!\n")
			}
			senao {
				notas[i] = nota
				pare
			}
		}
	}

	funcao real faz_media(real notas[]) {
		real media
		inteiro quantidade_elementos = Util.numero_elementos(notas)

		media = soma_elementos(notas) / quantidade_elementos

		retorne media
	}

	funcao real soma_elementos(real notas[]) {
		inteiro i
		real soma = 0.0

		para (i = 0; i < Util.numero_elementos(notas); i++) {
			soma += notas[i]
		}

		retorne soma
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 427; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
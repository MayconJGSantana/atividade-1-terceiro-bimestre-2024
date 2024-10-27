programa
{
	inclua biblioteca Util
	inclua biblioteca Matematica
	inclua biblioteca Texto
	
	funcao inicio()
	{
		inteiro numeros[] = {0, 1, 2, 3, 4}

		 cabecalho_principal()
		 pula_linha()

		 mostra_lista_invertida(numeros)

		 tracos("", 40)
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

	funcao vazio cabecalho_principal() {
		cadeia enunciado = "Exercício 2"

		tracos(enunciado, 40)
	}
	
	// Pula uma linha
	funcao vazio pula_linha() {
		escreva("\n")
	}



	// Mostra a lista
	funcao vazio mostra_lista_invertida(inteiro lista[]) {
		inteiro i
		
		para (i = Util.numero_elementos(lista) - 1; i >= 0; i--) {
			escreva("	Índice: ", i, " || ", i + 1, " - ", "Número: ", lista[i])
			pula_linha()
		}
	}
}

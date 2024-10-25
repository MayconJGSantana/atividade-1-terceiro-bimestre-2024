programa
{
	inclua biblioteca Texto
	
	funcao inicio()
	{
		cadeia nome
		inteiro dia_nascimento
		inteiro mes_nascimento
		cadeia enunciado
		caracter primeira_letra_nome
		cadeia primeira_letra[][] = {{"a", "A verdadeira ", "Água com limão "}, {"b", "A excitante ", "Bacon "}, {"c", "A alegre ", "Cúrcuma "}, {"d", "A horripilante ", "Doce de leite "}, {"e", "A fatal", "Azeite "}, {"f", "A apaixonante ", "Frango "}, {"g", "A trágica ", "Gengibre "}, {"h", "A sangrenta ", "Adoçantes "}, {"i", "A famosa ", "Açúcar "}, {"j", "A grande ", "Jiló "}, {"k", "A penosa ", "Kumbucha "}, {"l", "A triste ", "Leite "}, {"m", "A desastrosa ", "Macarrão "}, {"n", "A formosa ", "Nata "}, {"o", "A obscura ", "Ovo "}, {"p", "A gloriosa", "Pizza "}, {"q", "A infeliz ", "Óleo de coco "}, {"r", "A emocionante ", "Rabanada "}, {"s", "A fantástica ", "Suco Detox "}, {"t", "A terrível ", "Sal rosa "}, {"u", "A aborrecida ", "Glutamina "}, {"v", "A incrível ", "Doce low carb "}, {"w", "A desgraçada ", "Whey protein "}, {"x", "A lamentável ", "Própolis "}, {"y", "A cômica ", "Comida japonesa "}, {"z", "A miserável ", "Peixe "}}
		cadeia mes_nascido[][] = {{"1", "façanha ", "ao acordar ", "Troque de vida com "}, {"2", "promessa ", "como pré-treino ", "Se case com "}, {"3", "batalha ", "injetável ", "Acorrentado pra vida com "}, {"4", "existência ", "no cabelo ", "Amigos para sempre com "}, {"5", "vida ", "em jejum ", "Preso sem internet com "}, {"6", "missão ", "de 3 em 3 horas ", "Apresenta um programa de TV com "}, {"7", "vingança ", "no chá ", "Tem que lutar com "}, {"8", "luta ", "no café ", "Tem como inspiração "}, {"9", "mudança ", "depois das 18:00 ", "Fará parte do elenco de um filme com "}, {"10", "lenda ", "como pós-treino ", "Seu inimigo mortal é "}, {"11", "história ", "no almoço ", "Tem que salvar a humanidade com "}, {"12", "biografia ", "antes de dormir ", "Na próxima vida vai nascer gêmeo siamês com "}}
		cadeia digito_ano_nacimento[][] = 

		leia(nome)
		nome = Texto.substituir(nome, " ", "")
		nome = Texto.caixa_baixa(nome)
		primeira_letra_nome = Texto.obter_caracter(nome, 0)

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1966; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
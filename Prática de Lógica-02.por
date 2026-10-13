programa {
    inclua biblioteca Matematica
	
	funcao inicio()
	{
		// Declaração de variáveis
		real km_rodados, litros_consumidos, preco_litro
		real rendimento, custo_total_diesel, custo_por_km

		// Entrada de dados
		escreva("Digite os quilómetros rodados: ")
		leia(km_rodados)
		
		escreva("Digite os litros de diesel consumidos: ")
		leia(litros_consumidos)
		
		escreva("Digite o preço do litro do diesel (R$): ")
		leia(preco_litro)

		// Processamento
		rendimento = km_rodados / litros_consumidos
		custo_total_diesel = litros_consumidos * preco_litro
		custo_por_km = custo_total_diesel / km_rodados

		rendimento = Matematica.arredondar(rendimento, 2)
		custo_total_diesel = Matematica.arredondar(custo_total_diesel, 2)
		custo_por_km = Matematica.arredondar(custo_por_km, 2)

		// Saída
		escreva("\n--- RESULTADOS DO TURNO ---")
		escreva("Rendimento: ", rendimento, " km/l")
		escreva("Custo total do diesel: R$ ", custo_total_diesel)
		escreva("Custo por km: R$ ", custo_por_km)
		escreva("---------------------------")

		escreva("Classificação do camião: ")
		
		se (rendimento >= 0.8)
		{
			escreva("EFICIENTE")
		}
		senao se (rendimento >= 0.6 e custo_por_km <= 9.00)
		{
			escreva("ACEITÁVEL")
		}
		senao
		{
			escreva("REVISAR CAMIÃO")
		}
	}
}


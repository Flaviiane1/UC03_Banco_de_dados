programa {
  funcao inicio() {
    // Declaração de variáveis
    inteiro qtdCaixas, paletesCompletos, caixasSobra
        real pesoCaixa, pesoTotal, temperaturaCamara
         // Entrada de Dados
        escreva("Digite a quantidade de caixas produzidas: ")
        leia(qtdCaixas)

        escreva("Digite o peso de cada caixa (kg): ")
        leia(pesoCaixa)

        escreva("Digite a temperatura da câmara (°C): ")
        leia(temperaturaCamara)
        // Processamento
        pesoTotal = qtdCaixas * pesoCaixa
        paletesCompletos = qtdCaixas / 40
        caixasSobra = qtdCaixas % 40
        // Saída
        escreva("\n--- RESULTADOS DA PRODUÇÃO ---")
        escreva("\n1. Peso total produzido: ", pesoTotal, " kg")
        escreva("\n2. Paletes completos: ", paletesCompletos, " | Caixas para o próximo turno: ", caixasSobra)

        escreva("\n3. Status do Carregamento: ")

        se (temperaturaCamara <= -18.0 e paletesCompletos > 0)
        {
            escreva("Carregamento liberado")
        }
        senao
        {
            se (temperaturaCamara > -18.0)
            {
                escreva("Câmara acima de −18 °C")
            }
            senao se (paletesCompletos == 0)
            {
                escreva("Nenhum palete completo")
            }
        }
        escreva("\n")
    }
}
  


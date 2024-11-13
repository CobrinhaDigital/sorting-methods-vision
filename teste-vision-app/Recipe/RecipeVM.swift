//
//  RecipesVM.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 05/11/24.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = [Recipe(id: UUID(), title: " Passo 1 - Preparação do Ambiente", description: "Pegue sua lista de 10 números e coloque-a em uma superfície plana (ou, no caso visualize no seu vision)"),
                                        Recipe(id: UUID(), title: "Passo 2 - Primeira Passagem", description: "Compare o primeiro número da lista com o número seguinte (primeiro com segundo). Se o primeiro for maior que o segundo, troque-os de posição."),
                                        Recipe(id: UUID(), title: "Passo 3 - Misture Novamente", description: "Mova para a próxima posição e repita o processo com os números seguintes (segundo com terceiro, terceiro com quarto, e assim por diante). Se encontrar um número maior à esquerda do seu par, troque de lugar."),
                                        Recipe(id: UUID(), title: "Passo 4 - Continue Misturando", description: "A cada passagem, ignore os números já organizados no final da lista, pois eles já estão em ordem. Repita esse processo até que não seja mais necessário fazer trocas em uma passagem completa."),
                                        Recipe(id: UUID(), title: "Passo 5 - Verificação Final", description: "Depois de algumas passagens, observe se nenhum número precisou ser trocado. Isso significa que sua lista está toda organizada em ordem crescente!"),
                                        Recipe(id: UUID(), title: "Passo 6 - Sirva", description: "Sua lista de 10 números está agora em ordem crescente. Pronta para servir ou usar da maneira que você desejar!")]
    
    @Published var isVisible: Bool = false
    @Published var blurRadius: CGFloat = 30
    @Published var isPositionUp: Bool = false
    
    func restartAnimation() {
        isVisible = false // Reseta a visibilidade
        blurRadius = 30 // Reseta o blur
        isPositionUp = false
        withAnimation(.spring(duration: 1.0)) {
            isVisible = true
            blurRadius = 0
            isPositionUp = true
        }
    }
    
}

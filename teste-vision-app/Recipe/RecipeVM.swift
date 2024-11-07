//
//  RecipesVM.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 05/11/24.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = [Recipe(id: UUID(), title: "Preparação do Ambiente", description: "Pegue sua lista de 10 números e coloque-a em uma superfície plana (ou, no caso visualize no seu computador)."),
                                        Recipe(id: UUID(), title: "Primeira Mistura (Primeira Passagem)", description: "Ao final desta primeira passagem, o maior número estará no final da lista. Pense nisso como a cereja do bolo subindo até o topo!"),
                                        Recipe(id: UUID(), title: "Misture Novamente", description: "Repita o processo de comparar e trocar, passando pela lista até o penúltimo número."),
                                        Recipe(id: UUID(), title: "Continue Misturando", description: "A cada passagem, ignore os números já organizados no final da lista, pois eles já estão em ordem. Repita esse processo até que não seja mais necessário fazer trocas em uma passagem completa."),
                                        Recipe(id: UUID(), title: "Verificação Final", description: "Depois de algumas passagens, observe se nenhum número precisou ser trocado. Isso significa que sua lista está toda organizada em ordem crescente!"),
                                        Recipe(id: UUID(), title: "Sirva", description: "Sua lista de 10 números está agora em ordem crescente. Pronta para servir ou usar da maneira que você desejar!")]
    
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

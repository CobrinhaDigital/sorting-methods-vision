//
//  MainView.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 08/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainView: View {
    @StateObject var imersiveViewModel = ImersiveViewModel()
    
    var body: some View {
        VStack {
            Button("Show Particles") {
                imersiveViewModel.isImmersiveSpaceActive = true // Alterna a exibição do espaço imersivo
            }
            .padding()
            .font(.system(size: 25, weight: .bold))
            .glassBackgroundEffect() // Estilização do botão
            
            HStack { // Use um VStack ou outro contêiner para agrupar as views
                TimerView()
                    .glassBackgroundEffect()
                    .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                    .scaleEffect(0.8)
                    .offset(z: 20)
                RecipeView()
    //                .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                    .glassBackgroundEffect()
            }
            .frame(minWidth: 1000, maxWidth: 1000, minHeight: 160, maxHeight: 160)
            AssetRowView(rowNum: 10)
                .frame(maxWidth: 200, minHeight: 200, maxHeight: 200)
        }
        .fullScreenCover(isPresented: $imersiveViewModel.isImmersiveSpaceActive) {
            Particles()
        }
    }
}

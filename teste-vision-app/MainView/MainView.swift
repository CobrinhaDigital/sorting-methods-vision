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
    @StateObject private var viewModel = TimerViewModel() // Instância padrão
    @StateObject var imersiveViewModel = ImersiveViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 300){
                if !viewModel.showEndMessage {
                    HStack {
                        TimerView()
                            .glassBackgroundEffect()
                            .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                            .scaleEffect(0.8)
                            .offset(z: 20)
                        RecipeView()
                            .glassBackgroundEffect()
                    }
                    .frame(minWidth: 1000, maxWidth: 1000, minHeight: 160, maxHeight: 160)
//                    Spacer()
                    
                    ZStack(alignment:.center){
                        Rectangle()
                            .fill(.clear)
                            .glassBackgroundEffect()
                            .frame(minWidth: 950, maxWidth: 950, minHeight: 200, maxHeight: 200)
                            .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: 0))

                        AssetRowView(rowNum: 10)
//                            .glassBackgroundEffect()
                            .frame(minWidth: 500, maxWidth: 500, minHeight: 100, maxHeight: 100)
                            .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: 0))
                            .offset(y: -20)
                    }
                    
                } else {
                    ZStack {
                        VStack {
                            Text("Timer encerrado")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .glassBackgroundEffect()
                            Button {
                                viewModel.showEndMessage = false
                            } label: {
                                Text("return to challenge")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .glassBackgroundEffect()
                        }
                        .offset(z: 20)
                        .transition(.opacity)
                        
                        Particles()
                    }
                }
            }
        }
        .onChange(of: viewModel.timerModel.timeRemaining) { newValue in
            if newValue == 0 {
                viewModel.showEndMessage = true
                imersiveViewModel.isImmersiveSpaceActive = true // Alterna a exibição do espaço imersivo
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainView()
}

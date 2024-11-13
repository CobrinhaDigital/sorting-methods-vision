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
    @Environment(\.openImmersiveSpace) var openImersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

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
                    
                    ZStack(alignment:.center){
                        Rectangle()
                            .fill(.clear)
                            .glassBackgroundEffect()
                            .frame(minWidth: 950, maxWidth: 950, minHeight: 200, maxHeight: 200)
                            .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: 0))

                        AssetRowView(rowNum: 10)
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
                                .opacity(viewModel.showEndMessage ? 1 : 0) // Inicia invisível
                                .scaleEffect(viewModel.showEndMessage ? 1 : 0.5) // Inicia com uma escala reduzida
                                .animation(.easeIn(duration: 0.5), value: viewModel.showEndMessage) // Aparece com animação
                            
                            Button {
                                viewModel.showEndMessage = false
                                Task {
                                    await dismissImmersiveSpace()
                                }
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
                    .transition(.move(edge: .top)) // Adiciona transição de movimento para o topo quando aparece
                }
            }
        }
        .onChange(of: viewModel.timerModel.timeRemaining) { newValue in
            if newValue == 0 {
                viewModel.showEndMessage = true
                
                Task {
                    await openImersiveSpace(id: "ParticlesImmersiveSpace")
                }
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    MainView()
}

//
//  teste_vision_appApp.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 04/11/24.
//

import SwiftUI

@main
struct teste_vision_appApp: App {
    @State private var showSplashScreen = true
    
    var body: some Scene {
//        WindowGroup {
//            AssetComponentView(num: 10)
//        }
//        .windowStyle(.plain)
////        .defaultSize(width: 3, height: 3, depth: 3, in: .meters)
////        .windowStyle(.plain)
//        
//        WindowGroup {
//            AssetComponentView(num: 10)
//        }
//        .windowStyle(.volumetric)
        // Adiciona o espaço imersivo
        ImmersiveSpace(id: "ParticlesImmersiveSpace") {
            Particles() // View imersiva com animação de partículas
        }
        .immersionStyle(selection: .constant(.full), in: .mixed)
        WindowGroup {
            if showSplashScreen {
                SplashScreenView()
                    .onAppear {
                        // Espera 3 segundos antes de mostrar a MainView
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                showSplashScreen = false // Desativa a splash screen e exibe a MainView
                            }
                        }
                    }
            } else {
                // Aqui você pode manter a lógica de navegação da sua MainView
                MainView()
            }
        }.windowStyle(.plain)
    }
}

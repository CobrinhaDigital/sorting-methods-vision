//
//  AssetView.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 07/11/24.
//

import SwiftUI
import VisionKit
import RealityKit
import RealityKitContent

struct AssetView: View {
    @State var sphereNum: Int
    @State private var offset = CGSize.zero // Estado para o deslocamento total da ZStack
    private let scaleFactor: CGFloat = 0.03 // Fator de escala para diminuir a sensibilidade
    
    var body: some View {
        ZStack {
            let radius = 0.028
            let side = 2 * radius * 1360
             
            RealityView { content in
                let ballMesh = MeshResource.generateSphere(radius: Float(radius))
                let material = SimpleMaterial(color: .clear, isMetallic: false)
                let ball = ModelEntity(mesh: ballMesh, materials: [material])
                
                ball.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                ball.generateCollisionShapes(recursive: true)
                ball.components.set(GroundingShadowComponent(castsShadow: true))
                
                content.add(ball)
            }
            .frame(width: side, height: side)
            .frame(depth: side)

            Text("\(sphereNum)")
                .font(.system(size: 35))
                .bold()
        }
        .offset(offset) // Aplicando o deslocamento à ZStack inteira
        .gesture(
            DragGesture()
                .onChanged { value in
                    // Atualizando o deslocamento da ZStack com base no movimento do gesto e no fator de escala
                    offset = CGSize(
                        width: offset.width + value.translation.width * scaleFactor,
                        height: offset.height + value.translation.height * scaleFactor
                    )
                }
                .onEnded { value in
                    // Aqui você pode adicionar lógica para aplicar algum efeito ou resetar a posição, se necessário
                }
        )
    }
}

#Preview {
    AssetView(sphereNum: 1)
}


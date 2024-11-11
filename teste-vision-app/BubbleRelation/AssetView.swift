//
//  AssetView.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 07/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct AssetView: View {
    @State var sphereNum: Int
    @State private var ball = ModelEntity()
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            let radius = 0.028
            let side = 2 * radius * 1360
             
            RealityView { content in
//                let modelSphere = MeshResource.generateSphere(radius: Float(radius))
//                let materialSphere = SimpleMaterial(color: .clear, isMetallic: false)
//                let entitySphere = ModelEntity(mesh: modelSphere, materials: [materialSphere])
//                entitySphere.components.set(InputTargetComponent())
//                content.add(entitySphere)
//                let ballMesh = MeshResource.generateSphere(radius: Float(radius))
//                let material = SimpleMaterial(color: .clear, isMetallic: false)
//                ball = ModelEntity(mesh: ballMesh, materials: [material])
//                
//                ball.components.set(InputTargetComponent(allowedInputTypes: .indirect))
//                ball.generateCollisionShapes(recursive: true)
//                ball.components.set(GroundingShadowComponent(castsShadow: true))
//                
//                content.add(ball)
                
                let textMesh = MeshResource.generateText(
                    "\(sphereNum)",
                    font: .boldSystemFont(ofSize: 0.05)
                )
                let textEntity = ModelEntity(mesh: textMesh)
                textEntity.model?.materials = [UnlitMaterial(color: .white)]
                textEntity.position.x = textMesh.bounds.center.x
                textEntity.position.y = textMesh.bounds.center.y
                
                content.add(textEntity)
                
                if let model = try? await Entity(named: "RealityKitContent", in: realityKitContentBundle) {
                    content.add(model)
                }
            }
            .frame(width: side, height: side)
            .frame(depth: side)
        }
        .offset(offset)
        .gesture(
            DragGesture()
//                .targetedToEntity(ball)
//                .onChanged({ value in
//                    ball.position = value.convert(value.location3D, from: .local, to: ball.parent!)
//                })
                .targetedToAnyEntity()
                .onChanged { value in
                    offset = value.translation
                }
                .onEnded { value in
                    //se coords nao colidir com outra bola
                        //voltar para inicial (CGPoint.zero?)
                    //se coords colidir
                        //trocar bolas de lugar
                }
        )
    }
}

#Preview {
    AssetView(sphereNum: 1)
}

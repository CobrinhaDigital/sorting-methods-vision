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
    @State private var ball = ModelEntity()
    
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
                let ballMesh = MeshResource.generateSphere(radius: Float(radius))
                let material = SimpleMaterial(color: .clear, isMetallic: false)
                ball = ModelEntity(mesh: ballMesh, materials: [material])
                
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
        .gesture(
            DragGesture()
                .targetedToEntity(ball)
                .onChanged({ value in
                    ball.position = value.convert(value.location3D, from: .local, to: ball.parent!)
                })
        )
    }
}

#Preview {
    AssetView(sphereNum: 1)
}

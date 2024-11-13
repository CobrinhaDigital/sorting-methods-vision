//
//  AssetShapeView.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 12/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct AssetShapeView: View {
    @State var sphereNum: Int
    var body: some View {
        ZStack {
            let radius = 0.028
            let side = 2 * radius * 1360
            
            RealityView { content in
                let ballShape = ShapeResource.generateSphere(radius: Float(radius))
                let ballShapeEntity = ModelEntity (
                    mesh: MeshResource.generateSphere(radius: Float(radius))
                )
                ballShapeEntity.components.set(CollisionComponent(shapes: [ballShape]))
                
                var physics = PhysicsBodyComponent(
                    shapes: [ballShape],
                    density: 10
                )
                
                physics.isAffectedByGravity = false
                
                ballShapeEntity.components.set(physics)
                ballShapeEntity.components.set(CollisionComponent(shapes: [ballShape]))
                
                content.add(ballShapeEntity)
            }
            .frame(width: side, height: side)
            .frame(depth: side)
            Text("\(sphereNum)")
                .font(.system(size: 35))
                .bold()
        }
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
        )
    }
}

#Preview {
    AssetShapeView(sphereNum: 10)
}

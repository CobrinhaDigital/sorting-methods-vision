import SwiftUI
import VisionKit
import RealityKit
import RealityKitContent

struct ColisionTestView: View {
    @State var sphereNum: Int
    @State private var ball1 = ModelEntity()
    @State private var ball2 = ModelEntity()
    @State private var ball = ModelEntity()
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            let radius = 0.028
            let side = 2 * radius * 1360
            
            RealityView { content in
                // Esfera 1
                let ballMesh = MeshResource.generateSphere(radius: Float(radius))
                let material = SimpleMaterial(color: .clear, isMetallic: false)
                ball = ModelEntity(mesh: ballMesh, materials: [material])
                 
                ball.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                ball.generateCollisionShapes(recursive: true)
                ball.components.set(GroundingShadowComponent(castsShadow: true))
                content.add(ball)
                
                // Esfera 2
                let ballMesh1 = MeshResource.generateSphere(radius: Float(radius))
                let material1 = SimpleMaterial(color: .blue, isMetallic: false) // Cor diferente
                ball1 = ModelEntity(mesh: ballMesh1, materials: [material1])
                
                ball1.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                ball1.generateCollisionShapes(recursive: true)
                ball1.components.set(GroundingShadowComponent(castsShadow: true))
                content.add(ball1)
                
                // Esfera 3
                let ballMesh2 = MeshResource.generateSphere(radius: Float(radius))
                let material2 = SimpleMaterial(color: .red, isMetallic: false) // Cor diferente
                ball2 = ModelEntity(mesh: ballMesh2, materials: [material2])
                
                ball2.components.set(InputTargetComponent(allowedInputTypes: .indirect))
                ball2.generateCollisionShapes(recursive: true)
                ball2.components.set(GroundingShadowComponent(castsShadow: true))
                content.add(ball2)
            }
            .frame(width: side, height: side)
            .frame(depth: side)
            
            Text("\(sphereNum)")
                .font(.system(size: 35))
                .bold()
        }
        .offset(offset)
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    offset = value.translation
                }
        )
    }
}


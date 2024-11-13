import SwiftUI
import VisionKit
import RealityKit
import RealityKitContent

struct SplashScreenView: View {
    let appName = "Bubbles" // Nome do app
    @State private var offsets: [CGSize] // Estados para o deslocamento de cada letra
    @State private var scale: [CGFloat] // Estado para animação de escala das letras
    @State private var rotation: [Angle] // Estado para animação de rotação das letras
    private let scaleFactor: CGFloat = 0.03 // Fator de escala para o gesto de arrasto

    init() {
        // Inicializa o array de offsets, escala e rotação para cada letra do nome
        _offsets = State(initialValue: Array(repeating: CGSize.zero, count: "Bubbles".count))
        _scale = State(initialValue: Array(repeating: 1.0, count: "Bubbles".count))
        _rotation = State(initialValue: Array(repeating: Angle(degrees: 0), count: "Bubbles".count))
    }

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea() // Cor de fundo
                .cornerRadius(40)
            HStack(spacing: 10) {
                ForEach(0..<appName.count, id: \.self) { index in
                    let letter = Array(appName)[index]
                    let radius = 0.028
                    let side = 2 * radius * 1360
                    ZStack {
                        // Adicionando a bolha (esfera) para cada letra
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
                        
                        // Adicionando a letra no centro da bolha com animação
                        Text(String(letter))
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .scaleEffect(scale[index]) // Animação de escala
                            .rotationEffect(rotation[index]) // Animação de rotação
                            .onAppear {
                                // Animações para quando a letra aparece
                                withAnimation(.easeOut(duration: 0.8).delay(Double(index) * 0.1)) {
                                    scale[index] = 1.5 // Aumenta a escala da letra
                                    rotation[index] = Angle(degrees: 360) // Gira a letra
                                }
                            }
                    }
                    .offset(offsets[index]) // Aplicando o deslocamento para cada bolha
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Atualizando o deslocamento para a letra correspondente
                                offsets[index] = CGSize(
                                    width: offsets[index].width + value.translation.width * scaleFactor,
                                    height: offsets[index].height + value.translation.height * scaleFactor
                                )
                            }
                            .onEnded { value in
                                // Lógica opcional para resetar a posição ou adicionar algum efeito
                            }
                    )
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}


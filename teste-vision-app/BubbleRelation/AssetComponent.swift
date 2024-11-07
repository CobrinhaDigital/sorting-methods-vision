//
//  AssetComponent.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 05/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SphereView {
    let id: UUID
}

struct AssetComponentView: View {
    @State var num: Int
//    @State var listaNum: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
//    func countNum() {
//        while num < 10 {
//            listaNum.append(String(num))
//            num += 1
//        }
//    }
    
    var body: some View {
            HStack {
                ForEach(0...num ,id: \.self) { index in
                    ZStack {
                        RealityView { content in
                            let modelSphere = MeshResource.generateSphere(radius: 0.03)
                            let materialSphere = SimpleMaterial(color: .clear, isMetallic: false)
                            let entitySphere = ModelEntity(mesh: modelSphere, materials: [materialSphere])
//                            let textStyle = MeshResource.generateText(
//                                "\(num)",
//                                extrusionDepth: 0.1,
//                                containerFrame: CGRect(x: -0.05, y: -0.1, width: 0.1, height: 0.1))
//                            let textMaterial = SimpleMaterial(color: .white, isMetallic: false)
//                            let text = ModelEntity(mesh: textStyle, materials: [textMaterial])
                            content.add(entitySphere)
//                            content.add(text)
                        }
                        Text("\(index)")
                            .offset(z: -450)
                            .font(.system(size: 50))
                            .bold()
                    }
                }
            }
        }
        
    }

#Preview(windowStyle: .volumetric) {
    AssetComponentView(num: 10)
}

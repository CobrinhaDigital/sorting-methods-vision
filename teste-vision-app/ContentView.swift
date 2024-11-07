//
//  ContentView.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 04/11/24.
//

import SwiftUI
import ARKit
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Organize em ordem crescente")
                .font(.largeTitle)
                .foregroundStyle(.green)
                .padding(.bottom, 100)
            HStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
//                    .draggable()
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                Model3D(named: "Scene", bundle: realityKitContentBundle)
            }
            RealityView { content in
                let model = MeshResource.generateSphere(radius: 0.1)
                let material = SimpleMaterial(color: .red, isMetallic: true)
                let entity = ModelEntity(mesh: model, materials: [material])
                content.add(entity)
            }
        }
        .padding()
        
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}

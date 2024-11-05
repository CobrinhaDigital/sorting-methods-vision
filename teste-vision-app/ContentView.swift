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
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                Model3D(named: "Scene", bundle: realityKitContentBundle)
            }
        }
        .padding()
        
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}

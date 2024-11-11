//
//  Particles.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 09/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Particles: View {
    var body: some View {
        RealityView { Content in
            if let scene = try? await Entity(named: "RealityKitContent", in: realityKitContentBundle) {
                Content.add(scene)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Particles()
}

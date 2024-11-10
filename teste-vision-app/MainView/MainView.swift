//
//  MainView.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 08/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainView: View {
    var body: some View {
        HStack { // Use um VStack ou outro contêiner para agrupar as views
            TimerView()
                .glassBackgroundEffect()
                .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                .scaleEffect(0.8)
                .offset(z: 20)
            RecipeView()
//                .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                .glassBackgroundEffect()
        }
        .frame(minWidth: 1000, maxWidth: 1000, minHeight: 160, maxHeight: 160)
    }
}

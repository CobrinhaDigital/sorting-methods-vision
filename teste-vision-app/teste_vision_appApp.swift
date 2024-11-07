//
//  teste_vision_appApp.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 04/11/24.
//

import SwiftUI

@main
struct teste_vision_appApp: App {
    var body: some Scene {
//        WindowGroup {
//            AssetComponentView(num: 10)
//        }
//        .windowStyle(.plain)
////        .defaultSize(width: 3, height: 3, depth: 3, in: .meters)
////        .windowStyle(.plain)
//        
//        WindowGroup {
//            AssetComponentView(num: 10)
//        }
//        .windowStyle(.volumetric)
        WindowGroup {
            AssetView(sphereNum: 1)
        }
    }
}

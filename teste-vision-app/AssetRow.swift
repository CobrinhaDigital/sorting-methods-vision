//
//  AssetRow.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 07/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct AssetRowView: View {
    @State var rowNum: Int
    
//    let randomNum = []
    
    var body: some View {
        HStack {
            ForEach(0...rowNum, id: \.self) { index in
                AssetView(sphereNum: index)
            }
        }
    }
}

#Preview {
    AssetRowView(rowNum: 10)
}

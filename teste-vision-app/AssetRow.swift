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
    
    let randomNum = (0..<10).map {
        _ in Int.random(in: 0..<10)
    }
    
    var body: some View {
        HStack {
            ForEach(0..<randomNum.count, id: \.self) { index in
                AssetView(sphereNum: randomNum[index])
            }
        }
    }
}

#Preview {
    AssetRowView(rowNum: 10)
}

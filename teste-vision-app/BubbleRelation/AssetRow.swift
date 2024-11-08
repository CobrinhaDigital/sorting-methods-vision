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
    
    let randomStrNum = (0..<101).map {
        _ in String(Int.random(in: 0..<101))
    }
    
    
    var body: some View {
        HStack {
            ForEach(0..<randomNum.count, id: \.self) { index in
                AssetView(sphereNum: randomNum[index])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AssetRowView(rowNum: 10)
}

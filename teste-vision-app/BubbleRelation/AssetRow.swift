//
//  AssetRow.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 07/11/24.
//

import SwiftUI
import ARKit
import RealityKit
import RealityKitContent

struct AssetRowView: View {
    @State var rowNum: Int
    
    var body: some View {
        
        let randomNum = (0..<rowNum).map { //qtd de bolhas
            _ in Int.random(in: 0..<100) //intervalo de bolhas
        }
        
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

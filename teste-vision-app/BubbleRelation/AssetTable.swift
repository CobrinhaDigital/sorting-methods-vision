//
//  AssetTable.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 07/11/24.
//

//EM PROGRESSO NAO RODAR ISSO !!!!!!!!!!!!!!!!!!!!!

import SwiftUI
import RealityKit
import RealityKitContent

struct AssetTableView: View {
    @State var columnNum: Int
    
    var body: some View {
        VStack {
            ForEach(0...columnNum, id: \.self) { column in
                HStack {
                    AssetRowView(rowNum: 10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AssetTableView(columnNum: 7)
}

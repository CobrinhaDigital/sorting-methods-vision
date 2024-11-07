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
    @State var rowNum: Int
    
    var body: some View {
        VStack {
            ForEach(0...columnNum, id: \.self) { column in
                HStack {
                    ForEach(0...rowNum, id: \.self) { row in
                        AssetRowView(rowNum: 0)
                    }
                }
            }
        }
    }
}

#Preview {
    AssetTableView(columnNum: 10, rowNum: 10)
}

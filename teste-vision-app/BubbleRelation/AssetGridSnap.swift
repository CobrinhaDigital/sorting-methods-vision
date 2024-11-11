//
//  AssetGridSnap.swift
//  teste-vision-app
//
//  Created by Beatriz Peixoto on 11/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SwiftUIView: View {

    let grid = [
        CGPoint(x: 100, y: 100),
        CGPoint(x: 200, y: 100),
        CGPoint(x: 300, y: 100),
        CGPoint(x: 100, y: 200),
        CGPoint(x: 200, y: 200),
        CGPoint(x: 300, y: 200),
    ]

    @State var location = CGPoint(x: 500, y: 500)
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            ForEach(Array(grid.enumerated()), id: \.offset) { (index, point) in
                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .position(x: point.x, y: point.y)
            }
            Circle()
                .fill(.green)
                .frame(width: 100, height: 100)
                .position(x: location.x, y: location.y)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            location = value.location
                        }
                        .onEnded { value in
                            let snap = grid.first {
                                CGRect(origin: $0, size: CGSize(width: 100, height: 100)).contains(value.location)
                            }
                            if let snap {
                                withAnimation {
                                    location = snap
                                }
                            }
                        }
                )
        }
    }
}

#Preview {
    SwiftUIView()
}

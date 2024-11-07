
//
//  RecipeView.swift
//  teste-vision-app
//
//  Created by ThiagoMotaMachado on 05/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(0..<viewModel.recipes.count, id: \.self) { index in
                    let recipe = viewModel.recipes[index]
                    
                    if index == 0 {
                        StageOneView(viewModel: viewModel, element: recipe)
                            .tag(index)
                    } else if index == 1 {
                        StageTwoView(viewModel: viewModel, element: recipe)
                            .tag(index)
                    } else if index == 2 {
                        StageThreeView(viewModel: viewModel, element: recipe)
                            .tag(index)
                    } else if index == 3 {
                        StageFourView(viewModel: viewModel, element: recipe)
                            .tag(index)
                    } else if index == 4 {
                        StageFiveView(viewModel: viewModel, element: recipe)
                            .tag(index)
                    }
                }
                .padding()
                .glassBackgroundEffect()
                .frame(width: 600, height: 400)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay (
                VStack {
                    HStack {
                        Button {
                            if selection < viewModel.recipes.count - 1 {
                                selection += 1
                                viewModel.restartAnimation()
                            } else if selection == viewModel.recipes.count - 1 {
                                selection = 0
                            }
                        } label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .glassBackgroundEffect()
                        .offset(z: 20)
                        .padding(.bottom, 90)
                        .padding(.leading, 480)
                    }
                }
                
            )
        }
    }
}

struct StageOneView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var element: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.title)
                .font(.title)
                .padding()
            Text(element.description)
                .font(.body)
                .padding()
        }
        .opacity(viewModel.isVisible ? 1 : 0)
        .blur(radius: viewModel.blurRadius)
        .offset(y: viewModel.isPositionUp ? -5 : 20 )
        .onAppear {
            viewModel.restartAnimation() // Chama a animação ao aparecer
        }
    }
}

struct StageTwoView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var element: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.title)
                .font(.title)
                .padding()
            Text(element.description)
                .font(.body)
                .padding()
        }
        .opacity(viewModel.isVisible ? 1 : 0)
        .blur(radius: viewModel.blurRadius)
        .offset(y: viewModel.isPositionUp ? -5 : 20 )
        .onAppear {
            viewModel.restartAnimation() // Chama a animação ao aparecer
        }
    }
}

struct StageThreeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var element: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.title)
                .font(.title)
                .padding()
            Text(element.description)
                .font(.body)
                .padding()
        }
        .opacity(viewModel.isVisible ? 1 : 0)
        .blur(radius: viewModel.blurRadius)
        .offset(y: viewModel.isPositionUp ? -5 : 20 )
        .onAppear {
            viewModel.restartAnimation() // Chama a animação ao aparecer
        }
    }
    
}

struct StageFourView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var element: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.title)
                .font(.title)
                .padding()
            Text(element.description)
                .font(.body)
                .padding()
        }
        .opacity(viewModel.isVisible ? 1 : 0)
        .blur(radius: viewModel.blurRadius)
        .offset(y: viewModel.isPositionUp ? -5 : 20 )
        .onAppear {
            viewModel.restartAnimation() // Chama a animação ao aparecer
        }
    }
}

struct StageFiveView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var element: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(element.title)
                .font(.title)
                .padding()
            Text(element.description)
                .font(.body)
                .padding()
        }
        .opacity(viewModel.isVisible ? 1 : 0)
        .blur(radius: viewModel.blurRadius)
        .offset(y: viewModel.isPositionUp ? -5 : 20 )
        .onAppear {
            viewModel.restartAnimation() // Chama a animação ao aparecer
        }
    }
}

#Preview {
    RecipeView()
}

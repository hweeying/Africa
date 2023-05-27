//
//  GalleryView.swift
//  Africa
//
//  Created by Jasmine Lai Hweeying on 24/05/2023.
//

import SwiftUI

struct GalleryView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
    
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridColumn: Double = 3.0
    
    var gridLayout:[GridItem] {
        return Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    @State private var isAnimating: Bool = false
    
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack (alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                    )
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    
                
                LazyVGrid (columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                               selectedAnimal = item.image
                                heptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn(duration: 0.5), value: isAnimating)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            .onAppear(perform: {
                isAnimating = true
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
        
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

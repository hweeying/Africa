//
//  HeadingView.swift
//  Africa
//
//  Created by Jasmine Lai Hweeying on 25/05/2023.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding()
    }
        
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}

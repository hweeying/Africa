//
//  CenterModifier.swift
//  Africa
//
//  Created by Jasmine Lai Hweeying on 27/05/2023.
//

import SwiftUI
struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View{
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}


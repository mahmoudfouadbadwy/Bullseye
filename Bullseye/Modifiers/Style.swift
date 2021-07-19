//
//  Style.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .shadow(color: Color.black, radius: 10, x: 2, y: 2)
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .modifier(Shadow())
            .padding(.all, 10)
            .background(Color.yellow)
    }
}

struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
    }
}

struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
    }
}

struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct AboutBodyStyle: ViewModifier {
       func body(content: Content) -> some View {
           return content
               .foregroundColor(Color.black)
               .font(Font.custom("Arial Rounded MT Bold", size: 16))
               .padding(.trailing, 20)
               .padding(.leading, 20)
               .padding(.bottom, 20)
       }
   }

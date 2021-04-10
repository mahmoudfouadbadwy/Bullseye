//
//  AboutView.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 2/9/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
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
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
                Text("This is bullseye, the game where you can win points and gain fame by dragging the slider.").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle()).lineLimit(nil)
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .navigationBarTitle("About bullseye")
          //  .background(Color.blue)
        }
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

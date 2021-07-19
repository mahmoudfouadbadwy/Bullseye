//
//  BullseyeButton.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct BullseyeButton: View {
    private let buttonStyle = ButtonStyle()

    var title: String
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .modifier( ButtonLargeTextStyle() )
        }
        .modifier(buttonStyle)
    }
}

struct BullseyeButton_Previews: PreviewProvider {
    static var previews: some View {
        BullseyeButton(title: "") {
            print("hi")
        }
    }
}

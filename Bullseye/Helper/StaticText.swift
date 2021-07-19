//
//  regularText.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct StaticText: View {
    private let labelStyle = LabelStyle()
    var txt: String
    var body: some View {
        Text(txt)
            .modifier(labelStyle)
    }
}

struct regularText_Previews: PreviewProvider {
    static var previews: some View {
        StaticText(txt: "")
    }
}

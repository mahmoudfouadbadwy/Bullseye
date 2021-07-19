//
//  DynamicText.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct DynamicText: View {
    private let valueStyle = ValueStyle()
    let txt: String
    var body: some View {
        Text(txt)
            .modifier(valueStyle)
    }
}

struct DynamicText_Previews: PreviewProvider {
    static var previews: some View {
        DynamicText(txt: "")
    }
}

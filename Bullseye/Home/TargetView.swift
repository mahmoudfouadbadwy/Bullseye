//
//  TargetView.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct TargetView: View {
    var targetVal: Int
    var body: some View {
        HStack {
            StaticText(txt: "Put the bullseye as close as you can to:")
            DynamicText(txt: "\(targetVal)")
        }
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(targetVal: 10)
    }
}

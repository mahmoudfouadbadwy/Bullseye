//
//  SliderView.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 7/18/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderVal: Double
    var body: some View {
        HStack {
            
            StaticText(txt: "1")
            Slider(value: $sliderVal, in: 1...100)
                .accentColor(Color.green)
            StaticText(txt: "100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    @State private static var val = 10.0
    static var previews: some View {
        SliderView(sliderVal: $val)
    }
}

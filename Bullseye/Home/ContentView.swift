//
//  ContentView.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 2/5/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var targetValue = Int.random(in: 1...100)
    @State private var score = 0
    @State private var roundNo = 1
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    TargetView(targetVal: self.targetValue)
                    
                    Spacer()
                    SliderView(sliderVal: $sliderValue)
                        .padding(10)
                    
                    Spacer()
                    BullseyeButton(title: "Hit me!") {
                        self.alertIsVisible = true
                    }
                    
                    Spacer()
                    HStack {
                        BullseyeButton(title: "Start Over"){
                            self.startNewGame()
                        }
                        Spacer()
                        StaticText(txt: "Score:")
                        DynamicText(txt: "\(self.score)")
                        
                        Spacer()
                        StaticText(txt: "Round:")
                        
                        DynamicText(txt: "\(self.roundNo)")
                        
                        Spacer()
                        NavigationLink(destination: AboutView()) {
                            Text("Info")
                                .modifier(ButtonLargeTextStyle())
                        }
                        .modifier(ButtonStyle())
                        
                    }
                    .padding(.all, 20)
                    
                }
                .padding(.vertical, geo.size.height * 0.2)
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color(.brown))
                .padding(.vertical, 10)
                .alert(isPresented: $alertIsVisible) {
                    Alert(title: Text(alertTitle()),
                          message: Text("The slider's value is \(self.getRoundedValue()). \n" +
                                            "and your score = \(self.getCurrentRoundScore())"),
                          dismissButton: .default(Text("Awesome!")) {
                            self.score += self.getCurrentRoundScore()
                            self.targetValue = Int.random(in: 1...100)
                            self.roundNo += 1
                          }
                    )
                }
                
            }
            .edgesIgnoringSafeArea(.vertical)
        }
        .navigationBarTitle("Bullseye")
    }
    
    private func getCurrentRoundScore() -> Int {
        let maxScore = 100
        let diff = getDiffValue()
        let bouns: Int
        switch diff {
        case 0:
            bouns = 100
        case 1:
            bouns = 50
        default:
            bouns = 0
        }
        return maxScore - diff + bouns
    }
    
    private func getRoundedValue() -> Int {
        Int(self.sliderValue.rounded())
    }
    
    private func getDiffValue() -> Int{
        abs(self.targetValue - getRoundedValue())
    }
    
    private func alertTitle() -> String {
        let title: String
        switch (getDiffValue()) {
        case 0 : title = "Perfect"
        case 5 : title = "Not bad"
        default: title = "try again"
        }
        return title
    }
    
    private func startNewGame() {
        score = 0
        roundNo = 1
        sliderValue = 50.0
        targetValue = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

//
//  ContentView.swift
//  Bullseye
//
//  Created by Mahmoud Fouad on 2/5/21.
//  Copyright © 2021 Mahmoud Fouad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK:- Properties
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var targetValue = Int.random(in: 1...100)
    @State private var score = 0
    @State private var roundNo = 1
    
    private let labelStyle = LabelStyle()
    private let valueStyle = ValueStyle()
    private let buttonStyle = ButtonStyle()
    private let buttonLargeTextStyle = ButtonLargeTextStyle()
    private let buttonSmallTextStyle = ButtonSmallTextStyle()
    
    //MARK:- ViewModifiers
    
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
    
    //MARK:- body
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(labelStyle)
                Text("\(self.targetValue)").modifier(valueStyle)
            }
            
            Spacer()
            HStack {
                Text("1").modifier(labelStyle)
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(labelStyle)
            }
            
            Spacer()
            Button(action: {
                self.alertIsVisible = true
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/).modifier(buttonLargeTextStyle)
            }.alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()),
                             message: Text("The slider's value is \(self.getRoundedValue()). \n" +
                                "and your score = \(self.getCurrentRoundScore())"),
                             dismissButton: .default(Text("Awesome!")){
                                self.score += self.getCurrentRoundScore()
                                self.targetValue = Int.random(in: 1...100)
                                self.roundNo += 1
                    })
            }.modifier(buttonStyle)
            
            Spacer()
            HStack {
                
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over").modifier(buttonSmallTextStyle)
                }.modifier(buttonStyle)
                
                Spacer()
                Text("Score:").modifier(labelStyle)
                Text("\(self.score)").modifier(valueStyle)
                
                Spacer()
                Text("Round:").modifier(labelStyle)
                Text("\(self.roundNo)").modifier(valueStyle)
                
                Spacer()
                NavigationLink(destination: AboutView()){
                        Text("Info").modifier(buttonSmallTextStyle)
                }.modifier(buttonStyle)
                
            }.padding(.all, 20)
            
        }
        .background(Color(.brown))
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

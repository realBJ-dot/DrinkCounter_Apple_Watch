//
//  ContentView.swift
//  Drink Counter WatchKit Extension
//
//  Created by Vivek Bhookya on 11/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSecondView = false
    var message = "Hello from ContentView"
    
    @State private var speed = 10.0
    @State private var isEditing = true
    
    var body: some View {
        
        VStack {
            
            Slider(
                value: $speed,
                in: 0...20,
                step: 1,
                onEditingChanged: { editing in
                    isEditing = editing
                },
                minimumValueLabel: Text("0"),
                maximumValueLabel: Text("20")
            ) {
                Text("Speed")
            }
            Text("Shots: " + String(Int(speed)))
                .foregroundColor(isEditing ? .green : .white)
                .font(.title2)
            
            Spacer()
            
            Button(action: {
                self.showSecondView.toggle()
            }) {
                Text("Let's party 😵")
            }.sheet(isPresented: $showSecondView) {
                DrinkCounterView(drinkLimit: Int(speed))
                    .toolbar(content: { // https://stackoverflow.com/questions/64194263
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Go back") {
                                self.showSecondView.toggle()
                            }
                        }
                    })
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: 150.0)
            
            
        }
        
        //        Button(action: {
        //            // What to perform
        //            randomInt = Int.random(in: 0..<messages.count)
        //            randomMsg = messages[randomInt]
        //            print(randomMsg)
        //            self.showSecondView.toggle()
        //        }) {
        //            Text("hi im button")
        //
        //
        //        }.sheet(isPresented: $showSecondView) {
        //            DrinkCounterView()
        //                .toolbar(content: { // https://stackoverflow.com/questions/64194263
        //                    ToolbarItem(placement: .cancellationAction) {
        //                        Button("Go back") {
        //                            self.showSecondView.toggle()
        //                        }
        //                    }
        //                })
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

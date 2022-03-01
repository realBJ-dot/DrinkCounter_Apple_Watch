//
//  ContentView.swift
//  Drink Counter WatchKit Extension
//
//  Created by Vivek Bhookya on 11/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSecondView = false
    @State private var drinksToCountPickerIndex = 0 // Represents index todo "subtract 1"
    
    var body: some View {
        VStack {
//            The "Label" in the Picker seems kinda small in terms of font size,
//             either learn to change the size, or add a Text and empty-string the Label,
//             or keep as-is. Would help to ask live users what they think of the size, if it even makes a difference...
//            Text("How many drinks to count")
//                .font(.subheadline)
//
//            Spacer()
            
            Picker(
                "How many drinks?",
                selection: $drinksToCountPickerIndex,
                content: {
                    ForEach(1..<21, content: {
                        index in Text(String(index))
                    })
                }
            )
            .font(.title)
            
            Spacer()
            
            Button(action: {
                print("Drinks to count = ")
                print(drinksToCountPickerIndex)
                self.showSecondView.toggle()
            }) {
//                Text("Let's drink 🥂")
                
                if (drinksToCountPickerIndex == 0) {
                    Text("Count 1 drink 🥂")
                }
                else {
                    Text("Count \(drinksToCountPickerIndex + 1) drinks 🥂")
                }
            }.sheet(isPresented: $showSecondView) {
                DrinkCounterView(drinkLimit: Int(drinksToCountPickerIndex + 1))
                    .toolbar(content: {
                        // https://stackoverflow.com/questions/64194263
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Go back") {
                                self.showSecondView.toggle()
                            }
                        }
                    })
            }
            .padding(.all)
            .font(.caption2)
//            .frame(width: 150.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

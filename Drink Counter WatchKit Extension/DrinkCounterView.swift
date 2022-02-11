//
//  DrinkCounter.swift
//  Drink Counter WatchKit Extension
//
//  Created by Vivek Bhookya on 12/1/21.
//

import SwiftUI

func calculateColorBasedOnDrinksConsumed(_ drinkCount: Int, _ limit: Int) -> Color {
    
    let ratio = Double(drinkCount) / Double(limit);
    print(ratio)
    
    if (ratio >= 0 && ratio < 0.25) {
        return Color.green
    }
    else if (ratio >= 0.25 && ratio < 0.5) {
        return Color.yellow
    }
    else if (ratio >= 0.5 && ratio < 0.75) {
        return Color.orange
    }
    else if (ratio >= 0.75 && ratio < 1) {
        return Color.red
    }
    else {
        return Color.pink
    }
    // Green
    // Yellow
    // Orange
    // Red
}

struct DrinkCounterView: View {
    @State private var drinksConsumedSoFar = 0
//    @State private var drinkLimit = 8
    
    var drinkLimit: Int
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()

//                Text(String(self.drinksConsumedSoFar) + " / " + String(self.drinkLimit))
//                    .font(.largeTitle)
//                    .fontWeight(.light)
//                    .foregroundColor(Color.black)
//                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Spacer()
                    
                    // https://www.appcoda.com/learnswiftui/swiftui-text.html
                    Text(String(self.drinksConsumedSoFar))
                        .font(.system(size: 75))
                        .fontWeight(.light)
                        .foregroundColor(Color.black)
                        .padding([.top, .leading, .trailing])
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("/ " + String(self.drinkLimit))
                            .font(.system(size: 20))
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.all)
                        
                    }
                }
                    
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // todo
                        if (self.drinksConsumedSoFar == 0) {
                            return
                        }
                        
                        self.drinksConsumedSoFar -= 1
                    }) {
                        Text("-")
                            .font(.title2)
                    }
                    .background(Color.clear)
                    .foregroundColor(.black)

//                    .buttonStyle(PlainButtonStyle())
                    .cornerRadius(50)
                    .padding()

                    Spacer()
                    
                    Button(action: {
                        self.drinksConsumedSoFar += 1
                    }) {
                        Text("+")
                            .font(.title2)
                    }
                    .background(Color.clear)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .padding()
                    
                    Spacer()
                }
                
//                Spacer()

            }
        }
        .background(
            calculateColorBasedOnDrinksConsumed(
                self.drinksConsumedSoFar,
                self.drinkLimit
            )
        )
        .ignoresSafeArea()
    }
}

struct DrinkCounterView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkCounterView(drinkLimit: 8)
    }
}

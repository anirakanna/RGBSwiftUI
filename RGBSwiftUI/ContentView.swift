//
//  ContentView.swift
//  RGBSwiftUI
//
//  Created by Evgenia Shipova on 19.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorView(color: UIColor(red: CGFloat(redSliderValue / 255), green: CGFloat(greenSliderValue / 255), blue: CGFloat(blueSliderValue / 255), alpha: 1))
                
                VStack {
                    ColorSliderStack(sliderValue: $redSliderValue, textFieldValue: String(Int(redSliderValue)), color: .red)
                    ColorSliderStack(sliderValue: $greenSliderValue, textFieldValue: String(Int(greenSliderValue)), color: .green)
                    ColorSliderStack(sliderValue: $blueSliderValue, textFieldValue: String(Int(blueSliderValue)), color: .blue)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

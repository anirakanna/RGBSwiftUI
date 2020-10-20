//
//  ColorSlider.swift
//  RGBSwiftUI
//
//  Created by Evgenia Shipova on 19.10.2020.
//

import SwiftUI

struct ColorSliderStack: View {
    @Binding var sliderValue: Double
    @State var textFieldValue: String
    @State var showAlert = false
    
    private var stringSliderValue: String {
        getString(value: sliderValue)
    }
    let color: Color
    
    var body: some View {
        HStack(spacing: 10) {
            Text(stringSliderValue)
                .frame(width: 40)
            
            Slider(value: $sliderValue, in: 0...255, step: 1, onEditingChanged: { _ in textFieldValue = stringSliderValue })
                .accentColor(color)
            
            //            TextForSliderValue(textFieldValue: $textFieldValue, showAlert: $showAlert, action: changeSliderValue())
            
            TextField("", text: $textFieldValue, onEditingChanged:  { _ in
                changeSliderValue()
            })
            .frame(width: 40)
            .background(Color.white)
            .cornerRadius(5)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Wrong format!"), message: Text("Enter number from 0 to 255"))
            })
        }
        .padding()
    }
    
    private func changeSliderValue()  {
        guard let number = Double(textFieldValue) else { showAlert = true; return }
        if number > 255 {
            showAlert = true
            textFieldValue = getString(value: sliderValue)
            return
        }
        sliderValue = number
    }
    
    private func getString(value: Double) -> String {
        String(Int(value))
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderStack(sliderValue: .constant(13.0), textFieldValue: "18", color: .red)
    }
}

//
//  TextField.swift
//  RGBSwiftUI
//
//  Created by Evgenia Shipova on 20.10.2020.
//

import SwiftUI

struct TextForSliderValue: View {
    @Binding var textFieldValue: String
    @Binding var showAlert: Bool
    var action: ()
    
    var body: some View {
        TextField("", text: $textFieldValue, onEditingChanged:  { _ in
            action
        })
        .frame(width: 40)
        .background(Color.white)
        .cornerRadius(5)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Wrong format!"), message: Text("Enter number from 0 to 255"))
        })
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextForSliderValue(textFieldValue: .constant(""), showAlert: .constant(false), action: {}())
    }
}


//
//  ContentView.swift
//  WeSplit
//
//  Created by Boris R on 25/04/23.
//

import SwiftUI
struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: "BRL"))
                // .currency(code: Locale.current.currencyCode ?? "AUD"))precisao aprender como verificar a localização e a moenda que ela usa como padrão. por hora irei colocar um tipo padrão
                    .keyboardType(.decimalPad)
            }
            Section{
                Text(checkAmount, format:  .currency(code: "BRL"))
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

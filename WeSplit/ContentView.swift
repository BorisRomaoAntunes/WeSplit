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
    @State private var tipPercentage = 0
    
    @FocusState private var amoutIsFocused: Bool
    
    var tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerson: Double{
        let peopleCout = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCout
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: "BRL"))
                        .keyboardType(.decimalPad)
                        .focused($amoutIsFocused)
                    
                    Picker ("Number of people", selection: $numberOfPeople){
                        ForEach (2..<100){
                            Text("\($0) pessoas")
                        }
                    }
                }
                Section{
                    Picker("Tip Percetage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text ("How much tip do you want to leave")
                }
                
                Section{
                    Text(totalPerson, format:  .currency(code: "BRL"))
                        .font(.largeTitle)
                } header: {
                    Text("total payable")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button ("Done"){
                        amoutIsFocused = false
                    }
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

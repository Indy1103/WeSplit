//
//  ContentView.swift
//  WeSplit
//
//  Created by Induwara on 2023-07-04.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 30
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = Double(checkAmount / 100) * tipSelection
        let grandTotal = Double(checkAmount) + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        
        let tipValue = Double(checkAmount / 100) * Double(tipPercentage)
        let Total = tipValue + Double(checkAmount)
        
        return Total
        
    }
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        
        NavigationView{
            Form{
                
                Section{
                    
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                        .keyboardType(.decimalPad).focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                    
                }
                
                Section{
                    
                    
                    Picker("Tip Percentage", selection: $tipPercentage){
                        
                        ForEach(tipPercentages, id: \.self){
                            
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                }header: {
                    
                    Text("Amount per person")
                }
                
                
                Section{
                    
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
                    
                }header: {
                    Text("Grand Total")
                }
                
                
            }.navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Spacer()
                        
                        Button("Done") {
                            amountIsFocused = false
                        }
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
    

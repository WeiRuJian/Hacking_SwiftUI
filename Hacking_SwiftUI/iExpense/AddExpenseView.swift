//
//  AddExpenseView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = "Swift"
    @State private var amount = ""
    private let types = ["Object-C", "Swift", "Flutter"]
    @ObservedObject var expense: Expenses
    @State private var isAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Selected Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .labelsHidden()
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle(Text("AddExpense"), displayMode: .automatic)
            .navigationBarItems(trailing: trailingButton)
        }
    }
    var trailingButton: some View {
        Button(action: {
            /// save something
            self.save()
            
        }){
            Image(systemName: "rosette").foregroundColor(.orange)
        }
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text(alertTitle),
                  message: Text(alertMessage),
                  dismissButton: Alert.Button.default(Text("Ok")))
        })
        
    }
    
    private func save() {
        guard self.name != "" else {
            alertMessage = "名称不能为空"
            alertTitle = "温馨提示~"
            isAlert = true
            return
        }
        guard let amout = Int(self.amount) else {
            alertMessage = "输入的金额有误"
            alertTitle = "温馨提示~"
            isAlert = true
            return
        }
        
        let ex = ExpensesItem(name: self.name,
                              type: self.type,
                              amount: amout)
        self.expense.items.insert(ex, at: 0)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expense: Expenses())
    }
}

//
//  StartSwiftUIView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/5.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct StartSwiftUIView: View {
    @State private var count = 0
    @State private var name = ""
    private let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    /// SwiftUI 必须使用字符串来存储文本字段值
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    private let tipPercentages = [10, 15, 20, 25, 0]
    private var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                /// 1.显示一个文本
                Section {
                    Text("Your name is \(name)")
                }
                /// 2.按钮点击计数
                Section(header: Text("按钮点击计数")){
                    Button("tap action: \(count)"){
                        self.count += 1
                    }
                }
                /// 3.输入框绑定
                Section(header: Text("输入框绑定")) {
                   TextField("input username", text: $name)
                }
                /// 4.ForEach
                Section(header: Text("ForEach")) {
                    ForEach(0..<5) {
                        Text("Row number \($0)")
                    }
                }
                /// 5.ForEach+Picker选择器
                Section(header: Text("ForEach+Picker选择器")) {
                    Picker("Select you student", selection: $selectedStudent) {
                        ForEach(0..<students.count) {
                            Text("\(self.students[$0])")
                        }
                    }
                }
                /// 6.使用TextField从用户读取文本
                Section(header: Text("使用TextField从用户读取文本(计算小费)")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Text("$\(checkAmount)")
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                    /// 6.1横向选择器
                    Picker("", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("totalPerPerson: $\(totalPerPerson, specifier: "%. 2f")")
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .large)
        }
    }
}

struct StartSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StartSwiftUIView()
    }
}

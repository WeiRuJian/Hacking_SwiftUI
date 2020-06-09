//
//  BetterRestStart.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct BetterRestStart: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    var body: some View {
        NavigationView {
            Form {
                /// 1.用步进器输入数字
                Section(header: Text("用步进器输入数字")) {
                    //                    Stepper(onIncrement: {
                    //                        self.sleepAmount += 1
                    //                    }, onDecrement: {
                    //                        self.sleepAmount -= 1
                    //                    }) {
                    //                        Text("\(self.sleepAmount, specifier: "%.2f") hours")
                    //                    }
                    /// 1.1步进器双向绑定输入
                    Section {
                       Stepper(value: $sleepAmount) {
                            Text("\(self.sleepAmount, specifier: "%.2f") hours")
                        }
                    }
                    /// 1.2现在步进器范围
                    Section {
                       Stepper(value: $sleepAmount, in: 4...12) {
                           Text("\(self.sleepAmount, specifier: "%.2f") hours")
                       }
                    }
                    /// 1.3设置步进器增量
                    Section {
                       Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                           Text("\(self.sleepAmount, specifier: "%.2f") hours")
                       }
                    }
                }
                /// 2.使用DatePicker选择日期和时间
                Section(header: Text("使用DatePicker选择日期和时间")) {
                    /// 2.1 默认
                    Section {
                        DatePicker("DatePicker", selection: $wakeUp)
                    }
                    /// 2.2 隐藏标题
                    Section {
                        DatePicker("DatePicker", selection: $wakeUp).labelsHidden()
                    }
                    /// 2.3 配置选项
                    Section {
                        DatePicker("Components DatePicker", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    }
                    /// 2.4 限制范围
                    Section {
                        DatePicker("Range DatePicker", selection: $wakeUp, in: Date() ... Date().addingTimeInterval(86400))
                    }
                }
            }
            .navigationBarTitle(Text("BetterRest"), displayMode: .large)
        }
    }
}

struct BetterRestStart_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestStart()
    }
}

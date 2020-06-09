//
//  BetterRestView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct BetterRestView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    /// 默认时间
    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("您想什么时候起床?").font(.headline)) {
                    DatePicker("请选择时间", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section(header: Text("所需的睡眠量").font(.headline)) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(self.sleepAmount, specifier: "%.2f") hours")
                    }
                }
                Section(header: Text("每日咖啡摄入量").font(.headline)) {
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if self.coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(self.coffeeAmount) cups")
                        }
                    }
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMessage),
                      dismissButton: Alert.Button.cancel(Text("Ok")))
            }
            .navigationBarTitle(Text("BetterRest"), displayMode: .large)
            .navigationBarItems(trailing:
                // Button("Calculate") {
                //   print("button tap")
                //   self.calculateBedtime()
                // }
                ///如果我们在括号后面加上括号，calculateBedtime则表示
                ///“调用calculateBedtime()，当点击按钮时，它将发送回正确的函数以使用。”
                ///因此，Swift要求calculateBedtime()返回一个闭包才能运行。
                ///通过编写calculateBedtime而不是calculateBedtime()
                ///告诉我们Swift在单击按钮时运行该方法，仅此而已；它不会返回任何应运行的内容。
                Button(action: calculateBedtime) {
                    Text("Calculate")
                }
            )
        }
    }
    //TODO: - 计算预测
    private func calculateBedtime() {
        /// 模型
        let model = BetterRest()
        /// 时间处理
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        do {
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "您理想的就寝时间是…"
            
        } catch {
            alertTitle = "出错了"
            alertMessage = "抱歉,计算您的入睡时间时出现问题."
            print("Prediction Error: \(error.localizedDescription)")
        }
        showAlert = true
    }
}

struct BetterRestView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestView()
    }
}

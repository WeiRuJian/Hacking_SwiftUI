//
//  GuessTheFlagView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/5.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct GuessTheFlagView: View {
    @State private var showAlert = false
    private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        NavigationView {
            Form {
                /// 1.堆叠布局视图
                Section(header: Text("ZStack")) {
                    ZStack {
                        Text("Hello, World")
                            .font(.largeTitle)
                            .background(Color.red)
                        Text("Hello, World").background(Color.orange)
                    }
                }
                /// 2. 水平布局
                Section(header: Text("HStack")) {
                    HStack(alignment: .firstTextBaseline, spacing: 20) {
                        Text("Hello, World")
                            .font(.largeTitle)
                            .background(Color.red)
                        Text("Hello, World").background(Color.orange)
                    }
                }
                /// 3.垂直布局
                Section(header: Text("VStack")) {
                    VStack(alignment: .trailing, spacing: 20) {
                        Text("Hello, World,1232").background(Color.red)
                        Text("Hello, World").background(Color.orange)
                    }
                }
                /// 4. 渐变
                Section(header: Text("Gradient")) {
                    /// 4.1 线性渐变沿一个方向运行，因此我们为其提供了一个起点和终点
                    LinearGradient(gradient: .init(colors: [.red, .orange, .white]), startPoint: .leading, endPoint: .trailing)
                    /// 4.2 径向渐变以圆形向外移动，因此，我们没有指定方向，而是指定了起点和终点半径-颜色应从圆心到圆心的距离开始和停止变化
                    RadialGradient(gradient: .init(colors: [.blue, .orange]), center: .center, startRadius: 10, endRadius: 10)
                    /// 4.3 渐变的中心为中心在单个渐变中循环显示一系列颜色
                    AngularGradient(gradient: Gradient(colors: [.red, .black, .blue, .orange]), center: .center)
                }
                /// 5.Button + Image + Alert
                Section(header: Text("Button Image")) {
                    Button(action: {
                        print("Button tap")
                        self.showAlert = true
                    }) {
                        Image(systemName: "pencil")
                            .renderingMode(.original)
                        Text("Action Me")
                            .foregroundColor(Color.white)
                    }
                    .alert(isPresented: $showAlert, content: { () -> Alert in
                        Alert(title: Text("我是一个弹框标题"),
                              message: Text("Message content"),
                              primaryButton: .destructive(Text("确定"), action: {
                                self.showAlert = false
                              }),
                              secondaryButton: Alert.Button.cancel(Text("取消")))
                    })
                        .background(LinearGradient(gradient: .init(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing))
                }
                /// 6.堆叠按钮
                Section(header: Text("ZStack Button")) {
                    VStack(spacing: 20) {
                        VStack {
                            Text("Tap the flag of")
                        }
                        ForEach(7..<10) { number in
                            Button(action: {
                                print("tap \(number)")
                            }) {
                                ZStack {
                                    Image(self.countries[number]).renderingMode(.original)
                                    Text(self.countries[number]).foregroundColor(.white)
                                }
                                
                            }
                        }
                    }
                }
                /// 7.修饰符顺序
                Section(header: Text("饰符顺序")) {
                    Text("Hello, World")
                        .padding()
                        .background(Color.red)
                        .padding()
                        .background(Color.orange)
                        .padding()
                        .background(Color.green)
                        .frame(width: 200, height: 200, alignment: .center)
                        .border(Color.blue, width: 2)
                }
                /// 8.自定义修饰符
                Section(header: Text("自定义修饰符")) {
                    Text("Hello, World")
                        .modifier(CustomTitle())
                }
                /// 9.自定义视图
                Section(header: Text("自定义视图")) {
                    CustomTitleView(text: "Hello, World!!")
                }
                /// 10.自定义容器
                Section(header: Text("自定义容器")) {
                    GridStack(rows: 3, cloumns: 3) { (row, cloumn)  in
                        VStack {
                            Image(systemName: "\(row * 4 + cloumn).circle")
                            Text("R: \(row) C:\(cloumn)")
                        }
                        .background(Color.orange)
                    }
                }
            }
            .navigationBarTitle(Text("GuessTheFlag"), displayMode: .large)
        }
    }
}

struct GuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagView()
    }
}

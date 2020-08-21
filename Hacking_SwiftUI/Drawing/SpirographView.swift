//
//  SpirographView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/11.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct Spirograph: Shape {
    /// 内圆半径
    var innerRadius: Int
    /// 外圆半径
    var outerRadius: Int
    /// 距离外圆中心
    var distance: Int
    /// 多少个轮盘
    var amount: CGFloat
    
    var animatableData: AnimatablePair<Double, AnimatablePair<Double, AnimatablePair<Double, Double>>> {
        get {
            AnimatablePair(Double(innerRadius),
                           AnimatablePair(Double(outerRadius),
                                          AnimatablePair(Double(distance),
                                                         Double(amount))))
        }
        set {
            self.innerRadius = Int(newValue.first)
            self.outerRadius = Int(newValue.second.first)
            self.distance = Int(newValue.second.second.first)
            self.amount = CGFloat(newValue.second.second.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, b: outerRadius)
        let outer = CGFloat(outerRadius)
        let inner = CGFloat(innerRadius)
        let distan = CGFloat(distance)
        // 内半径和外半径之间的差
        let difference = inner - outer
        // 需要执行多少步来绘制轮盘
        let endPoint = ceil(2 * CGFloat.pi * outer / CGFloat(divisor)) * amount
        
        /// X等于半径差乘以theta的余弦，X等于距离乘以半径差的余弦除以外半径再乘以theta。
        /// Y等于半径差乘以theta的正弦，即距离减去半径乘以半径差的正弦除以外半径再乘以theta所得的值。
        var path = Path()
        for theta in stride(from: 0, to: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distan * cos(difference / outer * theta)
            var y = difference * sin(theta) - distan * sin(difference / outer * theta)
            x += rect.width / 2
            y += rect.height / 2
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
    }
    
    // 我们从该数据中准备三个值，从内半径和外半径的最大公约数（GCD）开始。
    // 通常使用Euclid算法计算两个数字的GCD
    private func gcd(_ a: Int, b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}
struct SpirographView: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    var body: some View {
        VStack {
            Spirograph(innerRadius: Int(innerRadius),
                       outerRadius: Int(outerRadius),
                       distance: Int(distance),
                       amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)
                .padding()
            Group {
                Text("内圆半径: \(innerRadius, specifier: "%.2f")")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding()
                Text("外圆半径: \(outerRadius, specifier: "%.2f")")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding()
                Text("到外圆中心距: \(distance, specifier: "%.2f")")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding()
                Text("多少个轮盘: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding()
                Text("颜色: \(hue, specifier: "%.2f")")
                Slider(value: $hue)
                    .padding()
            }
        }
    }
}

struct SpirographView_Previews: PreviewProvider {
    static var previews: some View {
        SpirographView()
    }
}

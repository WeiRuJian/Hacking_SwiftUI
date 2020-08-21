//
//  AnimatableDataShapeView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/11.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
    var insertAmount: CGFloat
    /// 丝滑动画
    var animatableData: CGFloat {
        get { insertAmount }
        set { self.insertAmount = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}

struct AnimatableDataShapeView: View {
    @State private var amount: CGFloat = 50
    var body: some View {
        print(amount)
        return Trapezoid(insertAmount: amount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    self.amount = CGFloat.random(in: 10...90)
                }
        }
    }
}

struct AnimationtableShapeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataShapeView()
    }
}

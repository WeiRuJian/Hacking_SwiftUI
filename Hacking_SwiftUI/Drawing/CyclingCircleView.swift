//
//  CyclingCircleView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct CyclingCircleView: View {
    @State var value = 0.0
    var body: some View {
        VStack {
            // 我们可以通过应用一个称为的新修饰符来解决此问题drawingGroup()。这告诉SwiftUI，在将视图内容作为单个渲染输出放回到屏幕上之前，它应该将视图的内容渲染到屏幕外图像中，这要快得多。在幕后，此功能由Metal提供支持，Metal是Apple的框架，可直接与GPU协同工作以实现极快的图形
            ColorCyclingCircle(amount: value)
            .frame(width: 300, height: 300)
                .padding()
                .drawingGroup()
            Slider(value: $value)
        }
        .padding()
        
    }
}

struct CyclingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CyclingCircleView()
    }
}

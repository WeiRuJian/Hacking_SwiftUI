//
//  MultiplyView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct MultiplyView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Romance")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Rectangle()
                    .fill(Color.orange)
                    .blendMode(.multiply)
            }
            .frame(width: 400, height: 300)
            .clipped()
            // 之所以命名为“ Multiply”，是因为它将每个源像素颜色与目标像素颜色相乘-在我们的示例中，
            // 是图像的每个像素和顶部的矩形的每个像素。每个像素具有RGBA的颜色值，
            // 范围从0（没有该颜色）到1（所有颜色），因此所得的最高颜色为1x1，最低的颜色为0x0。
            // 将乘法与纯色配合使用会产生一种非常常见的色调效果：黑色保持黑色（因为它们的颜色值为0，
            // 所以无论您将顶部乘以0的多少，都会产生0），而较浅的颜色会变成黑色的各种阴影。着色。
            // 实际上，乘法是如此普遍，以至于有一个快捷键修饰符，这意味着我们可以避免使用ZStack
            Image("Romance")
                .colorMultiply(.orange)
        }
        
        
    }
}

struct MultiplyView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyView()
    }
}

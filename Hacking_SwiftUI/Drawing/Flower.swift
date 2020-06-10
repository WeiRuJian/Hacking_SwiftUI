//
//  Flower.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//
//1.创建一个新的空路径。
//2.从0到pi乘以2（弧度为360度），然后每次计数为pi的八分之一，这将为我们提供16个花瓣。
//3.创建一个等于当前数字的旋转变换。
//4.加上该旋转，移动量等于绘制空间宽度和高度的一半，因此每个花瓣都位于形状的中心。
//5.为花瓣创建一个新路径，该路径等于特定大小的椭圆。
//6.将我们的变换应用到该椭圆，以便将其移到位置。
//7.将花瓣的路径添加到我们的主路径中。

import SwiftUI

struct Flower: Shape {
    /// 花瓣中心偏移
    var petalOffset: Double = 20
    /// 花瓣的宽度
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // 从0向上计数到pi * 2，每次向上移动pi / 8
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // 根据循环的当前值旋转花瓣
            let rotation = CGAffineTransform(rotationAngle: number)
            // 将花瓣移到视图的中心
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            // 通过固定的Y和高度为此花瓣创建路径
            let petalPath = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            // 将我们的旋转/位置变换应用于花瓣
            let rotatePetal = petalPath.applying(position)
            // 将其添加到我们的主要路径
            path.addPath(rotatePetal)
        }
        return path
    }
}

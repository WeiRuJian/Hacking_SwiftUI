//
//  ColorCyclingCircle.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount: Double
    var steps = 100
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2 )
            }
        }
    }
    
    private func color(for value: Int, brightness: Double) -> Color {
       var hue = Double(value) / Double(steps) + amount
        if hue > 1 {
            hue = -1
        }
        return Color(hue: hue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingCircle(amount: 0)
    }
}

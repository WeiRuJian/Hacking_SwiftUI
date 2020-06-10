//
//  DrawingFlowerView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct DrawingFlowerView: View {
    @State private var petalWidth: Double = 100
    @State private var petalOffset: Double = -20.0
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .stroke(Color.red)
//                .fill(Color.red, style: FillStyle(eoFill: true))
            .padding()
            Text("Offset: --- \(petalOffset, specifier: "%.2f")")
            Slider(value: $petalOffset, in: -40.0...40.0)
                .padding([.horizontal, .bottom])
            Text("Width: --- \(petalWidth, specifier: "%.2f")")
            Slider(value: $petalWidth, in: 0...200)
                .padding(.horizontal)
        }
    }
}

struct DrawingFlowerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingFlowerView()
    }
}

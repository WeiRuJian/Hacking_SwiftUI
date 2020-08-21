//
//  AnimatablePairShapeView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/11.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

extension Color {
    static var randomColor: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1))
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var cloumns: Int
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(cloumns))
        }
        set {
            self.rows = Int(newValue.first)
            self.cloumns = Int(newValue.second)
        }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let rowSize = rect.width / CGFloat(rows)
        let cloumnSize = rect.height / CGFloat(cloumns)
        for row in 0..<rows {
            for cloumn in 0..<cloumns {
                if (row + cloumn).isMultiple(of: 2) {
                    let startX = cloumnSize * CGFloat(cloumn)
                    let startY = rowSize * CGFloat(row)
                    let rect = CGRect(x: startX, y: startY, width: cloumnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct AnimatablePairShapeView: View {
    @State private var rows = 4
    @State private var cloumns = 4
    var body: some View {
        Checkerboard(rows: rows, cloumns: cloumns)
            .fill(Color.randomColor)
            .onTapGesture {
                withAnimation {
                    self.rows = Int.random(in: 2...32)
                    self.cloumns = Int.random(in: 2...32)
                }
        }
    }
}

struct AnimatablePairShapeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairShapeView()
    }
}

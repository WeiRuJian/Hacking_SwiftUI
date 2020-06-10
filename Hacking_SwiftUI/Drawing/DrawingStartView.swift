//
//  DrawingStartView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { (path) in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}

struct DrawingStartView: View {
    var body: some View {
        VStack {
            Path { (path) in
                path.move(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 300))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 100, y: 200))
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            
            
            Path { (path) in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
            Triangle()
                .fill(Color.red)
                .frame(width: 200, height: 300)
        }
    }
}

struct DrawingStartView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingStartView()
    }
}

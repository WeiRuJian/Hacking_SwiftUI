//
//  ArrowView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/11.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    var width: CGFloat
    func path(in rect: CGRect) -> Path {
        
    
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: width * sqrt(2)))
        path.addLine(to: CGPoint(x: rect.maxX - width * sqrt(2) * 2,
                                 y: (rect.maxY / 2) - (width / 2)))
        path.addLine(to: CGPoint(x: 0, y: (rect.maxY / 2) - (width / 2)))
        path.addLine(to: CGPoint(x: 0, y: (rect.maxY / 2) + (width / 2)))
        path.addLine(to: CGPoint(x: rect.maxX - width * sqrt(2) * 2,
                                 y: (rect.maxY / 2) + (width / 2)))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY - width * sqrt(2)))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        return path
    }
}

struct ArrowView: View {
    var body: some View {
        Arrow(width: 40)
            .frame(width: 400, height: 300)
        .padding()
        
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}

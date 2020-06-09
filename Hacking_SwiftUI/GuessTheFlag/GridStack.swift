//
//  GridStack.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/5.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let cloumns: Int
    let content: (Int, Int) ->Content
    /// 1.View协议
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.cloumns, id: \.self) { cloumn in
                        self.content(row, cloumn)
                    }
                }
            }
            
        }
    }
    
    /// 2.视图构建器
    init(rows: Int, cloumns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.cloumns = cloumns
        self.content = content
    }
}

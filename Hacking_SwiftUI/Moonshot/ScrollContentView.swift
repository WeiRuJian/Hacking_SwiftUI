//
//  ScrollContentView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ScrollContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<100) {
                    Text("----\($0)")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.orange)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContentView()
    }
}

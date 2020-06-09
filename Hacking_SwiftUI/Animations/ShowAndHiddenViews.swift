//
//  ShowAndHiddenViews.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ShowAndHiddenViews: View {
    @State private var isShowing = false
    var body: some View {
        VStack {
            Button("animation") {
                withAnimation(.easeInOut) {
                    self.isShowing.toggle()
                }
            }
            if isShowing {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 200, height: 200, alignment: .center)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ShowAndHiddenViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowAndHiddenViews()
    }
}

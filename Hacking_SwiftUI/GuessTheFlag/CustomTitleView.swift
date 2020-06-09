//
//  CustomTitleView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/5.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct CustomTitleView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.orange)
    }
}

struct CustomTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitleView(text: "Hello, World")
    }
}

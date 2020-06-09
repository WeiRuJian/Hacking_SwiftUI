//
//  CustomTitle.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/5.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.orange)
            .font(.largeTitle)
            .background(Color.gray)
    }
}

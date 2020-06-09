//
//  ViewModifierTransition.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct CornerRotateViewModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content.rotationEffect(Angle(degrees: amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateViewModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateViewModifier(amount: 0, anchor: .topLeading))
    }
}

struct ViewModifierTransition: View {
    @State private var isShow = false
    var body: some View {
        VStack {
            Button("ViewModifier") {
                withAnimation {
                    self.isShow.toggle()
                }
            }
            if isShow {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: isShow ? 200:0, height: isShow ? 200:0)
                    .transition(.pivot)
            }
            
        }
    }
}

struct ViewModifierTransition_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierTransition()
    }
}

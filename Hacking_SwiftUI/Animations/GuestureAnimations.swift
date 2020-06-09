//
//  GuestureAnimations.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct GuestureAnimations: View {
    @State private var dregSize = CGSize.zero
    @State private var isEnable = false
    private let letters = Array("Hello SwiftUI")
    var body: some View {
        VStack {
            LinearGradient(gradient: .init(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dregSize)
                .gesture(
                    DragGesture()
                        .onChanged{ self.dregSize = $0.translation }
                        .onEnded {_ in
                            withAnimation(.spring()) {
                                self.dregSize = .zero
                            }
                    }
            )
            HStack(spacing: 10) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.isEnable ? Color.blue:.red)
                        .offset(self.dregSize)
                        .animation(
                            Animation.default
                                .delay(Double(num / 20))
                    )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged{ self.dregSize = $0.translation }
                    .onEnded {_ in
                        withAnimation(.spring()) {
                            self.dregSize = .zero
                            self.isEnable.toggle()
                        }
                }
            )
        }
    }
}

struct GuestureAnimations_Previews: PreviewProvider {
    static var previews: some View {
        GuestureAnimations()
    }
}

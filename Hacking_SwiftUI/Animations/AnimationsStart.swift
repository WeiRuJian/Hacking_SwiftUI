//
//  AnimationsStart.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct AnimationsStart: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationRatation: CGFloat = 0.0
    @State private var isEnable = false
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button("animations") {
                        print("button tap")
                        //self.animationAmount += 1
                    }
                    .padding(50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                        //.scaleEffect(animationAmount)
                        .blur(radius:(animationAmount - 1) * 3)
                        .animation(
                            Animation.easeIn(duration: 1)
                                .repeatCount(3, autoreverses: true)
                    )
                }
                Section {
                    Button("animations") {
                        print("button tap")
                        //                        self.animationAmount += 1
                    }
                    .padding(50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.red)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeInOut(duration: 0.6)
                                    .repeatForever(autoreverses: true)
                        )
                        
                    )
                        .onAppear {
                            self.animationAmount = 2
                    }
                }
                Section(header: Text("---")) {
                    Stepper("\(animationAmount, specifier: "%.2f")", value: $animationAmount.animation(
                        Animation.easeIn(duration: 1)
                            .repeatCount(3, autoreverses: true)
                    ), in: 0...10, step: 0.01)
                }
                Section {
                    Button("animations") {
                        print("button tap")
                        withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                            self.animationRatation += 360
                        }
                    }
                    .padding(50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(color: .red, radius: 4)
                    .rotation3DEffect(
                        .degrees(Double(animationRatation)), axis: (x: 0, y: 1, z: 0)
                    )
                }
                Section {
                    Button("animation") {
                        self.isEnable.toggle()
                    }
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(isEnable ? Color.blue:.red)
                    .animation(nil)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: isEnable ? 60:0))
                    .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                }
            }
            .navigationBarTitle(Text("AnimationsStart"), displayMode: .large)
        }
        
    }
}

struct AnimationsStart_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsStart()
    }
}

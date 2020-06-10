//
//  OverlappingCirclesView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct OverlappingCirclesView: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: amount * 200)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: amount * 200)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: amount * 200)
                    .offset(x: 0, y: 20)
                    .blendMode(.screen)
            }
            .frame(width: 400, height: 400)
            Slider(value: $amount)
                .padding()
            
            Image("Romance")
                .resizable()
                .scaledToFit()
                .saturation(Double(amount))
                .blur(radius: (1-amount) * 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
        
        
    }
}

struct OverlappingCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        OverlappingCirclesView()
    }
}

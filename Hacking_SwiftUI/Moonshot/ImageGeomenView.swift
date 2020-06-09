//
//  ImageGeomenView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ImageGeomenView: View {
    var body: some View {
        GeometryReader { (geo)  in
            Image("aldrin")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: 300)
                .clipped()
        }
    }
}

struct ImageGeomenView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGeomenView()
    }
}

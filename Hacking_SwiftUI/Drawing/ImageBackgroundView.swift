//
//  ImageBackgroundView.swift
//  Hacking_SwiftUI
//
//  Created by 韦儒健 on 2020/6/10.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ImageBackgroundView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 200)
            .border(ImagePaint(image: Image("white"), scale: 1), width: 20)
            
        
    }
}

struct ImageBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBackgroundView()
    }
}

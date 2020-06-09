//
//  PresentView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct PresentView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, \(name)!")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView(name: "---")
    }
}

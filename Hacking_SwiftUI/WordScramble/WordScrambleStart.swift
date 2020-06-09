//
//  WordScrambleStart.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct WordScrambleStart: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Static Row")) {
                    Text("Static row 0")
                    Text("Static row 1")
                    Text("Static row 2")
                }
                Section(header: Text("Dynamic Row")) {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("WordScrambleStart"), displayMode: .large)
        }
        
    }
}

struct WordScrambleStart_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleStart()
    }
}

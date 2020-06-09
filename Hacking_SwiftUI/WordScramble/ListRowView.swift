//
//  ListRowView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/6.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    let people = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var body: some View {
        NavigationView {
            List(people, id: \.self) { p in
                HStack(alignment: .center, spacing: 10) {
                    Image(p)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("List ForEach Row \(p)")
                    Button("") {
                        print(self.people.randomElement() ?? "--")
                    }
                }
            }
            .navigationBarTitle(Text("ListForEach"), displayMode: .large)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView()
    }
}

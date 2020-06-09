//
//  ExpenseDetailView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct ExpenseDetailView: View {
    var item: ExpensesItem
    var body: some View {
        VStack {
            Text("Name: \(item.name)")
                .font(.largeTitle)
            Text("Type: \(item.type)")
                .font(.headline)
            Text("$\(item.amount)").foregroundColor(.red)
            Spacer()
        }
    }
}

struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView(item: ExpensesItem(name: "", type: "", amount: 0))
    }
}

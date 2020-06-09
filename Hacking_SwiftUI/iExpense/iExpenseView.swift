//
//  iExpenseView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

/// 若数据中没有可作为唯一值得时候,添加Identifiable协议 重写id 作为唯一值得区分
struct ExpensesItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
/// 该拓展方式编辑时出现奇怪的视图更新
//extension ExpensesItem: Identifiable {
//    var id: UUID {
//        return UUID()
//    }
//}

class Expenses: ObservableObject {
    @Published var items: [ExpensesItem] {
        didSet {
            /// 数据持久化
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    init() {
        /// 从本地初始化数据
        if let items = UserDefaults.standard.data(forKey: "items") {
            if let decoded = try? JSONDecoder().decode([ExpensesItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct iExpenseView: View {
    @ObservedObject var expenses = Expenses()
    @State private var currentIndex = 0
    @State private var isPush = false
    var body: some View {
        NavigationView {
            List {
                /// 1.数据中有可作为唯一值
                //                 ForEach(expenses.items, id: \.name) {
                //                     Text("\($0.name) -- \($0.type) -- \($0.amount)")
                //                 }
                /// 2.数据中没有可作为唯一值时,通过遵循Identifiable协议重写id
                ForEach(expenses.items) { item in
                    NavigationLink(destination: ExpenseDetailView(item: item)) {
                        Text("\(item.name) -- \(item.type) -- \(item.amount)")
                    }
                }
                .onDelete(perform: remove)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("iExpense"), displayMode: .large)
            .navigationBarItems(leading: leadingButton,
                                trailing: EditButton())
                .sheet(isPresented: $isPush) {
                    AddExpenseView(expense: self.expenses)
            }
        }
    }
    var leadingButton: some View {
        //        NavigationLink(destination: AddExpenseView(expense: self.expenses), isActive: $isPush) {
        //        }
        Button(action: {
            print("add")
            /// 1.自增
            //            self.currentIndex += 1
            //            let expense = ExpensesItem(name: "Test--\(self.currentIndex)",
            //                type: "Swift",
            //                amount: .random(in: 3...10))
            //            self.expenses.items.insert(expense, at: 0)
            
            /// 2.新页面添加
            self.isPush.toggle()
        }) {
            Image(systemName: "plus").foregroundColor(.orange)
        }
    }
    private func remove(_ offset: IndexSet) {
        self.expenses.items.remove(atOffsets: offset)
    }
    private func move(from source: IndexSet, to destination: Int) {
        self.expenses.items.move(fromOffsets: source, toOffset: destination)
    }
}

struct iExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseView()
    }
}

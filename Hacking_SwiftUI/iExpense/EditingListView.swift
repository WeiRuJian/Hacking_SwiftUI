//
//  EditingListView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct EditingListView: View {
    @State private var titles = [String]()
    @State private var persons = [Int]()
    @State private var currentIndex = 0
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(persons, id: \.self) { person in
                        Text("Person -- Xiao Ming\(person)")
                    }
                    .onDelete(perform: remove)
                    .onMove(perform: move)
                }
                
                List {
                    ForEach(titles, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeStr)
                .onMove(perform: moveStr)
                }
            }
            .navigationBarTitle(Text("EditingList"))
            .navigationBarItems(leading: leadingItem,
                                trailing: EditButton().foregroundColor(.orange))
        }
        
    }
    var leadingItem: some View {
        Button(action: {
            self.currentIndex += 1
            self.persons.insert(self.currentIndex, at: 0)
            self.titles.insert("Xiao Ming--\(self.currentIndex)", at: 0)
        }, label: {
            Image(systemName: "plus").foregroundColor(.orange)
        })
    }
    
    private func remove(_ offset: IndexSet) {
        self.persons.remove(atOffsets: offset)
    }
    private func move(from source: IndexSet, to destination: Int) {
        self.persons.move(fromOffsets: source, toOffset: destination)
    }
    private func removeStr(_ offset: IndexSet) {
        self.titles.remove(atOffsets: offset)
    }
    private func moveStr(from source: IndexSet, to destination: Int) {
        self.titles.move(fromOffsets: source, toOffset: destination)
    }
}

struct EditingListView_Previews: PreviewProvider {
    static var previews: some View {
        EditingListView()
    }
}

//
//  StructAndStateView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/8.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct User {
    var firstname = "XiaoMing"
    var lastname = "Huang"
}

class Userclass: ObservableObject {
    @Published var firstname = "XiaoMing"
    @Published var lastname = "Huang"
}

struct StructAndStateView: View {
    @State private var user = User()
    @ObservedObject var userc = Userclass()
    @State private var isPresent = false
    var body: some View {
        Form {
            Section {
                Text("User: \(user.firstname)·\(user.lastname)")
                TextField("First Name", text: $user.firstname)
                TextField("Last Name", text: $user.lastname)
            }
            Section {
                Text("User: \(userc.firstname)·\(userc.lastname)")
                TextField("First Name", text: $userc.firstname)
                TextField("Last Name", text: $userc.lastname)
            }
            Section {
                Button("present") {
                    self.isPresent.toggle()
                }
                .sheet(isPresented: $isPresent){
                    PresentView(name: "\(self.userc.lastname)·\(self.userc.firstname)")
                }
            }
        }
    }
}

struct StructAndStateView_Previews: PreviewProvider {
    static var previews: some View {
        StructAndStateView()
    }
}

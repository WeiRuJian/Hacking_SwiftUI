//
//  MoonshotView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

extension Bundle {
    static func decode<T: Codable>(file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("Could not file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not fileData")
        }
        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("JSONDecoder Error")
        }
        return model
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let crew: [Crew]
    let launchDate: String?
    let description: String
    
    var displayName: String {
        return "Apollo \(id)"
    }
    var image: String {
        return "apollo\(id)"
    }
    var formatterLaunchDate: String {
        guard let date = launchDate else {
            return "N/A"
        }
        return date
    }
}

struct Crew: Codable {
    let name: String
    let role: String
}

struct MoonshotView: View {
    private let astronauts: [Astronaut] = Bundle.decode(file: "astronauts.json")
    private let missions: [Mission] = Bundle.decode(file: "missions.json")
    @State private var isShowDate = false
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading, spacing: 6) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isShowDate {
                            HStack {
                                ForEach(mission.crew, id:\.role) { crew in
                                    Text(crew.name)
                                }
                            }
                        } else {
                            Text(mission.formatterLaunchDate)
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.isShowDate.toggle()
                }
            }, label: {
                Image(systemName: "list.dash")
            }))
                .navigationBarTitle("Moonshot")
        }
    }
}

struct MoonshotView_Previews: PreviewProvider {
    static var previews: some View {
        MoonshotView()
    }
}

//
//  MissionView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    private var mission: Mission
    private var crewMember: [CrewMember]
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var temp = [CrewMember]()
        for crew in mission.crew {
            if let macth = astronauts.first(where: {$0.id == crew.name}) {
                temp.append(CrewMember(role: crew.role, astronaut: macth))
            }
        }
        self.crewMember = temp
    }
    var body: some View {
        GeometryReader { geome in
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geome.size.width * 0.7)
                        .padding(.top)
                    Text(self.mission.formatterLaunchDate)
                        .foregroundColor(.secondary)
                    Text(self.mission.description)
                        .font(.body)
                        .padding()
                    Spacer(minLength: 20)
                    ForEach(self.crewMember, id: \.role) { member in
                        NavigationLink(destination: AstronautView(astronaut: member.astronaut)) {
                            HStack {
                                Image(member.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text(member.astronaut.name)
                                        .font(.headline)
                                    Text(member.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                            /// 避免导航链接将Button渲染为蓝色
                            .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.decode(file: "missions.json")
        let astronauts: [Astronaut] = Bundle.decode(file: "astronauts.json")
        return MissionView(mission: missions[0], astronauts: astronauts)
    }
}

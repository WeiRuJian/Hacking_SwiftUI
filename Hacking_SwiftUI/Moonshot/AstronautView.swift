//
//  AstronautView.swift
//  WeSplit
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    private var astronaut: Astronaut
    private var missions: [Mission]
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let ms: [Mission] = Bundle.decode(file: "missions.json")
        self.missions = ms.filter {$0.crew.filter {$0.name == astronaut.id }.count > 0}
    }
    var body: some View {
        GeometryReader { geome in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geome.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    ForEach(self.missions, id: \.id) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading, spacing: 6) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formatterLaunchDate)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
       
        return AstronautView(astronaut: Astronaut(id: "grissom", name: "Virgil I. \"Gus\" Grissom", description: "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor."))
    }
}

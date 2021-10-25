//
//  StarshipViewMain.swift
//  API-JSON
//
//  Created by David on 17/10/21.
//

import SwiftUI

//Starship list main view
struct StarshipViewMain: View {
    @State var starship: [StarshipResults] = []
    
    var body: some View {
            List {
                ForEach(starship, id:\.id) { ship in
                    NavigationLink(destination: AddStarshipView(shipItem: ship)) {
                        VStack {
                            Text("\(ship.name )").padding()
                                .font(.headline)
                        }.padding(7)
                    }
                }
            }.onAppear(){
                StarshipAPI().getData { (ship) in
                    self.starship = ship
                }
            }
            .navigationTitle("Star Wars Starships")
    }
}

struct StarshipViewMain_Previews: PreviewProvider {
    static var previews: some View {
        StarshipViewMain()
    }
}

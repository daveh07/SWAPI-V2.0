//
//  AddStarshipView.swift
//  API-JSON
//
//  Created by David on 17/10/21.
//

import SwiftUI

//Starship list item view
struct AddStarshipView: View {
    @State var ship: [StarshipResults] = []
    
    let shipItem: StarshipResults
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("Title:")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                            Text(shipItem.name)
                                .font(.title3)
                        }
                    VStack(alignment: .leading) {
                        Text("Model:")
                            .font(.title2)
                            .fontWeight(.bold)

                            Text(shipItem.model)
                                .font(.title3)
                        }
                        
                    VStack(alignment: .leading) {
                        Text("Manufacturer:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.manufacturer)
                                .font(.title3)
                        }
                        
                    VStack(alignment: .leading) {
                        Text("Price:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.costInCredits)
                                .font(.title3)
                        }
                        
                    VStack(alignment: .leading) {
                        Text("Ship Length:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.length)
                                .font(.title3)
                        }
                
                    VStack(alignment: .leading) {
                        Text("Max. Speed:")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                            Text(shipItem.maxAtmospheringSpeed)
                                .font(.title3)
                        }
                }
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("Crew:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.crew)
                                .font(.title3)
                        }
                    
                    VStack(alignment: .leading) {
                        Text("Passenger Limit:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.passengers)
                                .font(.title3)
                        }
                        
                    VStack(alignment: .leading) {
                        Text("Cargo Capacity:")
                            .font(.title2)
                            .fontWeight(.bold)

                            Text(shipItem.cargoCapacity)
                                .font(.title3)
                        }

                    VStack(alignment: .leading) {
                        Text("Consumables:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.consumables)
                                .font(.title3)
                        }
                     
                    VStack(alignment: .leading) {
                        Text("Hypodrive Rating:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.hyperdriveRating)
                                .font(.title3)
                        }
                }
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("MGLT:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.mglt)
                                .font(.title3)
                        }
                    
                    VStack(alignment: .leading) {
                        Text("Starship Class:")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(shipItem.starshipClass)
                                .font(.title3)
                        }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 25)
            .foregroundColor(.black)
            .background(Color("Color3").cornerRadius(10).opacity(0.4))
            .navigationTitle(Text(shipItem.name))
        }
    }
}

//
//  ContentView.swift
//  API-JSON
//
//  Created by David on 16/10/21.
//

import SwiftUI

class API_ROOT {

    @Published var root_keys: [API_KEYS] = []
    
    let api_rootURL = URL(string: "https://swapi.dev/api/")
    
    struct API_KEYS: Codable {
        let films, starships: String
    }
    
    func getRootData() {
        URLSession.shared.dataTask(with: api_rootURL!) { (data, response, error) in
            guard let root_data = data, error == nil else { return }
            
            do {
            let root_keys = try? JSONDecoder().decode([API_KEYS].self, from: root_data)
                    DispatchQueue.main.async {
                        self.root_keys = (root_keys ?? [])
                        }
            } catch {
                print(error)
            }
        }.resume()
    }
}



struct ContentView: View {
    @State var film: [Result] = []


    init() {
        API_ROOT().getRootData()
    }
        var body: some View {
            
            NavigationView {
                
                ZStack {
                    
                    //Background image main/content view
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                
                    VStack{
                        Text("SW API")
                            .font(.system(size: 80))
                            .fontWeight(.medium)
                            .padding(.vertical, 20)
                            .foregroundColor(Color("Color1"))
                        Spacer()
                        }
                    
                    VStack{
                        NavigationLink(destination: FilmViewMain()) {
                            Text("FILMS")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("Color2"))
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(Color("Color1"))
                                .clipShape(Capsule())
                                .padding(.vertical, 60)
                            }
                        NavigationLink(destination: StarshipViewMain()) {
                            Text("STARSHIPS")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("Color2"))
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .background(Color("Color1"))
                                .clipShape(Capsule())
                                .padding(.vertical, 60)
                            }
                    }
                }
            }.edgesIgnoringSafeArea(.top)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

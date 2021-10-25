//
//  FilmViewMain.swift
//  API-JSON
//
//  Created by David on 17/10/21.
//

import SwiftUI


//Film main view
struct FilmViewMain: View {
    @State var film: [Result] = []
    
    var body: some View {
            List {
                ForEach(film, id:\.id) { f in
                    NavigationLink(destination: AddFilmView(filmItem: f)) {
                        VStack {
                            Text("\(f.title ?? "")").padding()
                                .font(.headline)
                        }.padding(7)
                    }
                }
            }.onAppear(){
                API().getData { (film) in
                    self.film = film
                }
            }
            .navigationTitle("Star Wars Films")
    }
}


struct FilmViewMain_Previews: PreviewProvider {
    static var previews: some View {
        FilmViewMain()
    }
}

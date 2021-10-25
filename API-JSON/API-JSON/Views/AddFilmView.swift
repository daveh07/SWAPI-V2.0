//
//  AddFilmView.swift
//  API-JSON
//
//  Created by David on 17/10/21.
//

import SwiftUI

//Film list item view
struct AddFilmView: View {
    @State var film: [Result] = []
    
    let filmItem: Result
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Title:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(filmItem.title!)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }
                .padding(7)
                
                Text("Director(s): ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(filmItem.director ?? "")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }.padding(7)
                
                Text("Producer(s): ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(filmItem.producer!)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }.padding(7)
                
                Text("Release Date: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(filmItem.releaseDate ?? "")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    }.padding(7)
                
                Text("Opening Crawl: ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                VStack {
                    Text(filmItem.openingCrawl!)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    }.padding(7)
            }
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(Color("Color3").cornerRadius(10).opacity(0.4))
            .padding()
            .navigationTitle(Text(filmItem.title ?? ""))
        }
    }
}


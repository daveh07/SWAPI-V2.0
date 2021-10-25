//
//  Data.swift
//  API-JSON
//
//  Created by David on 16/10/21.
//

import SwiftUI


//DATA MODELS
// Film Model
struct Films: Codable {
    let results: [Result]
}

//Film Properties
struct Result: Codable, Identifiable {
    var id = UUID()
    let title: String?
    let episodeID: Int?
    let openingCrawl, director, producer, releaseDate: String?
    let characters, planets, starships, vehicles: [String]?
    let species: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

// Starship Model
struct Starships: Codable {
    let results: [StarshipResults]
}

// Starship Properties
struct StarshipResults: Codable, Identifiable {
    var id = UUID()
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, hyperdriveRating, mglt: String
    let starshipClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case pilots, films, created, edited, url
    }
}

//Fetch Film API and return decoded JSON
class API {
    func getData(completion: @escaping ([Result]) -> ()) {
        guard let url = URL(string: "https://swapi.dev/api/films/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let filmData = data else { return }
            do {
            
                let film = try? JSONDecoder().decode(Films.self, from: filmData)
                DispatchQueue.main.async {
                    print(film!)
                    completion(film?.results ?? [])
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

//Fetch Starship API and return decoded JSON
class StarshipAPI {
    
    @Published var dataArray: [StarshipResults] = []
    @Published var filteredArray: [StarshipResults] = []
    
// Sort array function - to be completed
//    init() {
//        filterArray()
//    }
//
//    func filterArray(){
//        filteredArray = dataArray.sorted { (length1, length2) -> Bool in
//            return length1.length < length2.length
//        }
//    }
    
    func getData(completion: @escaping ([StarshipResults]) -> ()) {
        guard let starship_url = URL(string: "https://swapi.dev/api/starships/") else {
            return
        }
        
        URLSession.shared.dataTask(with: starship_url) { (data, response, error) in
            guard let starshipData = data else { return }
            do {
            
                let ship = try? JSONDecoder().decode(Starships.self, from: starshipData)
                DispatchQueue.main.async {
                    print(ship!)
                    completion(ship?.results ?? [])
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

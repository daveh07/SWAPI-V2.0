import UIKit
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
    func getData() {
        guard let url = URL(string: "https://swapi.dev/api/films/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let filmData = data else { return }
                let film = try? JSONDecoder().decode(Films.self, from: filmData)
                    print(film!)
        }.resume()
    }
}

//Fetch Starship API and return decoded JSON
class StarshipAPI {
    
    func getData() {
        guard let starship_url = URL(string: "https://swapi.dev/api/starships/") else {
            return
        }
        
        URLSession.shared.dataTask(with: starship_url) { (data, response, error) in
            guard let starshipData = data else { return }
                let ship = try? JSONDecoder().decode(Starships.self, from: starshipData)
                    print(ship!)
        }.resume()
    }
}

class API_ROOT {

    @Published var root_keys: [API_KEYS] = []
    
    let api_rootURL = URL(string: "https://swapi.dev/api/")
    
    struct API_KEYS: Codable {
        let films, starships: String
    }
    
    func getRootData() {
        URLSession.shared.dataTask(with: api_rootURL!) { (data, response, error) in
            guard let root_data = data, error == nil else { return }
            

            let root_keys = try? JSONDecoder().decode([API_KEYS].self, from: root_data)
            print(self.root_keys)
        }.resume()
    }
}


//API_ROOT().getRootData()
API().getData()
//StarshipAPI().getData()

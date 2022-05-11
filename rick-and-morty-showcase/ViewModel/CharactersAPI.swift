//
//  CharactersAPI.swift
//  rick-and-morty-showcase
//
//  Created by Eduarda Soares Serpa Camboim on 11/05/22.
//

import Foundation

struct CharactersAPI {
    
    func requestCharacters(page: Int = 0, completionHandler: @escaping ([Character]) -> Void) {
        if page < 0 { fatalError("Page should not be lower than 0") }
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            typealias RMCharacter = [String: Any]
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let characters = dictionary["results"] as? [RMCharacter]
                    
            else {
                completionHandler([])
                return
            }
            
            var arrayCharacters: [Character] = []
            
            for characterDictionary in characters {
                guard let id = characterDictionary["id"] as? Int,
                      let name = characterDictionary["name"] as? String,
                      let specie = characterDictionary["species"] as? String,
                      let image_path = characterDictionary["image"] as? String,
                      let status = characterDictionary["status"] as? String,
                      let gender = characterDictionary["gender"] as? String,
                      let origin = characterDictionary["origin"] as? [String: Any],
                      let location = characterDictionary["location"] as? [String: Any]
                        
                else { continue }
                
                let nameOrigin = origin["name"]
                let nameLocation =  location["name"]
                
                
                let character = Character(id: id, name: name, specie: specie, image_path: image_path, status: status, gender: gender, origin: nameOrigin as! String, location: nameLocation as! String)
                
                arrayCharacters.append(character)
            }
            
            completionHandler(arrayCharacters)
            
        }
        .resume()
        
    }
    
}

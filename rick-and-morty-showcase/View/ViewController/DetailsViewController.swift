//
//  DetailsViewController.swift
//  RickAndMortyChallenge
//
//  Created by Eduarda Soares Serpa Camboim on 13/09/21.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var characterDetails: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        
            if let character = characterDetails {

            
                let url = URL(string: character.image_path)

                let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in

                    DispatchQueue.main.async {
                        cell.characterImage.image = UIImage(data: data!)!
                        cell.characterImage.layer.cornerRadius = 10

                    }
            }
            task.resume()
            
                cell.characterName.text = character.name
                cell.characterSpecie.text = " 🔹 Specie: \(character.specie)"
                cell.characterStatus.text = " 🔹 Status: \(character.status)"
                cell.characterGender.text = " 🔹 Gender: \(character.gender)"
    
        }
        
        
        
        return cell
    }
    

}

//
//  ViewController.swift
//  rick-and-morty-showcase
//
//  Created by Eduarda Soares Serpa Camboim on 11/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [Character] = []
    
    let rickAndMortyAPI = CharactersAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        rickAndMortyAPI.requestCharacters { (characters) in
            self.characters = characters
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersCell", for: indexPath) as! CharactersTableViewCell
        

        let character = characters[indexPath.row]

        let url = URL(string: character.image_path)

        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in

            DispatchQueue.main.async {
                cell.characterImage.image = UIImage(data: data!)!
                cell.characterImage.layer.cornerRadius = 10

            }
        }
        task.resume()
        
        cell.characterName.text = character.name
        cell.characterSpecie.text = character.specie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Lembrem-se de colocar um booleano pra controlar as requisições
        // E lembrem-se de controlarem em que página estamos para pedirmos apenas a próxima
        if (indexPath.row == characters.count - 1) {
            rickAndMortyAPI.requestCharacters(page: 2) { (characters) in
                self.characters.append(contentsOf: characters)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail", let indexPath = sender as? IndexPath {
            let character = characters[indexPath.row]
            guard let destination = segue.destination as? DetailsViewController else { return }
            destination.characterDetails = character
        }
    }


}
    


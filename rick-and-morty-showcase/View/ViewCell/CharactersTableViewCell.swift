//
//  CharactersTableViewCell.swift
//  RickAndMortyChallenge
//
//  Created by Eduarda Soares Serpa Camboim on 13/09/21.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterSpecie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  DetailsTableViewCell.swift
//  RickAndMortyChallenge
//
//  Created by Eduarda Soares Serpa Camboim on 13/09/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterSpecie: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterOrigin: UILabel!
    @IBOutlet weak var characterLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

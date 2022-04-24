//
//  RepoTableViewCell.swift
//  LoginAndRegistrationPage
//
//  Created by Enrique Plinio Alata Vences on 24/04/22.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    var repo : Repo? {
        didSet{
            guard let repo = repo else {return}
            
            repoLabel.text = repo.name
        }
    }

    @IBOutlet weak var repoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

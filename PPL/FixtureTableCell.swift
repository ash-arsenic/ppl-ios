//
//  FixtureTableCell.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

class FixtureTableCell: UITableViewCell {

    
    @IBOutlet weak var fixtureHomeTeam: UILabel!
    
    @IBOutlet weak var fixtureAwayTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

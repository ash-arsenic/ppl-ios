//
//  LeagueTableCell.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

class LeagueTableCell: UITableViewCell {

    
    @IBOutlet weak var leaguePositionLB: UILabel!
    
    @IBOutlet weak var leagueTeamLB: UILabel!
    
    @IBOutlet weak var teamWinLB: UILabel!
    
    @IBOutlet weak var teamLoseLB: UILabel!
    
    @IBOutlet weak var teamPointsLB: UILabel!
    
    @IBOutlet weak var teamDrawLB: UILabel!
    
    @IBOutlet weak var teamGDLB: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

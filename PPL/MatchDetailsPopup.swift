//
//  MatchDetailsPopup.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

class MatchDetailsPopup: UIView {

    static var popupAction: ((String?, String?)->())?
//    Vars and Outlets
    @IBOutlet var parentView: MatchDetailsPopup!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var homeTeamScoreTF: UITextField!
    @IBOutlet weak var awayTeamScoreTF: UITextField!
    
    @IBOutlet weak var homeTeamNameLB: UILabel!
    
    
    @IBOutlet weak var awayTeamNameLB: UILabel!
    
    var fixture: Fixtures?
    //    Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("MatchDetailsPopup", owner: self, options: nil)
        setUpDime()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func saveScoreAction(_ sender: Any) {
//        let homeTeamScore = Int(homeTeamScoreTF.text ?? "0")
//        let awayTeamScore = Int(awayTeamScoreTF.text ?? "0")
//        var updatedFixture: Fixtures?
//        if homeTeamScore! > awayTeamScore! {
//            let htData = ["name": fixture?.homeTeam?.name,
//                          "wins": fixture?.homeTeam?.wins+1,
//                          "loses": fixture?.homeTeam?.loses,
//                          "draws": fixture?.homeTeam?.draws,
//                          "goalFor": fixture?.homeTeam?.goalFor + homeTeamScore,
//                          "goalBy": fixture?.homeTeam?.goalBy + awayTeamScore,
//                          "gd": (fixture?.homeTeam?.gd + homeTeamScore - awayTeamScore),
//                          "points": fixture?.homeTeam?.points + 3]
//            let atData = ["name": fixture?.awayTeam?.name,
//                          "wins": fixture?.awayTeam?.wins,
//                          "loses": fixture?.awayTeam?.loses + 1,
//                          "draws": fixture?.awayTeam?.draws,
//                          "goalFor": fixture?.awayTeam?.goalFor + awayTeamScore,
//                          "goalBy": fixture?.awayTeam?.goalBy + homeTeamScore,
//                          "gd": (fixture?.awayTeam?.gd - homeTeamScore + awayTeamScore),
//                          "points": fixture?.awayTeam?.points - 3]
//
//            let ht = TeamModel(data: htData)
//            let at = TeamModel(data: atData)
//            updatedFixture = Fixtures(homeTeam: ht, awayTeam: at)
//
//        } else if  homeTeamScore! < awayTeamScore! {
//            let htData = ["name": fixture?.homeTeam?.name,
//                          "wins": fixture?.homeTeam?.wins,
//                          "loses": fixture?.homeTeam?.loses + 1,
//                          "draws": fixture?.homeTeam?.draws,
//                          "goalFor": fixture?.homeTeam?.goalFor + homeTeamScore,
//                          "goalBy": fixture?.homeTeam?.goalBy + awayTeamScore,
//                          "gd": (fixture?.homeTeam?.gd + homeTeamScore - awayTeamScore),
//                          "points": fixture?.homeTeam?.points - 3]
//            let atData = ["name": fixture?.awayTeam?.name,
//                          "wins": fixture?.awayTeam?.wins + 1,
//                          "loses": fixture?.awayTeam?.loses,
//                          "draws": fixture?.awayTeam?.draws,
//                          "goalFor": fixture?.awayTeam?.goalFor + awayTeamScore,
//                          "goalBy": fixture?.awayTeam?.goalBy + homeTeamScore,
//                          "gd": (fixture?.awayTeam?.gd - homeTeamScore + awayTeamScore),
//                          "points": fixture?.awayTeam?.points + 3]
//
//            let ht = TeamModel(data: htData)
//            let at = TeamModel(data: atData)
//
//            updatedFixture = Fixtures(homeTeam: ht, awayTeam: at)
//
//        } else {
//            let htData = ["name": fixture?.homeTeam?.name,
//                          "wins": fixture?.homeTeam?.wins,
//                          "loses": fixture?.homeTeam?.loses,
//                          "draws": fixture?.homeTeam?.draws + 1,
//                          "goalFor": fixture?.homeTeam?.goalFor + homeTeamScore,
//                          "goalBy": fixture?.homeTeam?.goalBy + awayTeamScore,
//                          "gd": fixture?.homeTeam?.gd,
//                          "points": fixture?.homeTeam?.points + 1]
//            let atData = ["name": fixture?.awayTeam?.name,
//                          "wins": fixture?.awayTeam?.wins,
//                          "loses": fixture?.awayTeam?.loses,
//                          "draws": fixture?.awayTeam?.draws + 1,
//                          "goalFor": fixture?.awayTeam?.goalFor + awayTeamScore,
//                          "goalBy": fixture?.awayTeam?.goalBy + homeTeamScore,
//                          "gd": fixture?.awayTeam?.gd,
//                          "points": fixture?.awayTeam?.points + 1]
//
//            let ht = TeamModel(data: htData)
//            let at = TeamModel(data: atData)
//
//            updatedFixture = Fixtures(homeTeam: ht, awayTeam: at)
//        }
        MatchDetailsPopup.popupAction?(homeTeamScoreTF.text ?? "0", awayTeamScoreTF.text ?? "0")
        parentView.removeFromSuperview()
    }
    
    func setUpDime() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        parentView.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    func showPopup(fixture: Fixtures?) {
        self.fixture = fixture
        homeTeamNameLB.text = fixture?.homeTeam?.name ?? "NA"
        awayTeamNameLB.text = fixture?.awayTeam?.name ?? "NA"
        
        let keyWindows = UIApplication.shared.windows.first
        keyWindows?.addSubview(parentView)
    }
}

//
//  FixturesVC.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

struct Fixtures {
    var homeTeam: TeamModel?
    var awayTeam: TeamModel?
    var score: [Int]?
}

class FixturesVC: UIViewController {
    
//    Vars and Outlets
    @IBOutlet weak var fixturesTV: UITableView!
    var fixtures: [Fixtures]?
    var popup: MatchDetailsPopup?
    var lastIndex = 0
    static var updateFixtureAction: (([Fixtures]) -> ())?
//    Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fixturesTV.delegate = self
        fixturesTV.dataSource = self
        closureDefinition()
        popup = MatchDetailsPopup()
    }

    @IBAction func updateTableFAction(_ sender: Any) {
        if let fixtures = self.fixtures {
            FixturesVC.updateFixtureAction!(fixtures)
        }
    }
    
    func closureDefinition() {
        MatchDetailsPopup.popupAction = { homeScore, awayScore in
            if Int(homeScore!)! > Int(awayScore!)! {
                self.fixtures?[self.lastIndex].homeTeam?.wins! += 1
                self.fixtures?[self.lastIndex].awayTeam?.loses! += 1
                self.fixtures?[self.lastIndex].homeTeam?.goalFor! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalFor! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.goalBy! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalBy! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.gd! += Int(homeScore!)! - Int(awayScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.gd! += Int(awayScore!)! - Int(homeScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.points! += 3
            } else if Int(homeScore!)! < Int(awayScore!)! {
                self.fixtures?[self.lastIndex].homeTeam?.loses! += 1
                self.fixtures?[self.lastIndex].awayTeam?.wins! += 1
                self.fixtures?[self.lastIndex].homeTeam?.goalFor! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalFor! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.goalBy! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalBy! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.gd! += Int(homeScore!)! - Int(awayScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.gd! += Int(awayScore!)! - Int(homeScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.points! += 3
            } else {
                self.fixtures?[self.lastIndex].homeTeam?.draws! += 1
                self.fixtures?[self.lastIndex].awayTeam?.draws! += 1
                self.fixtures?[self.lastIndex].homeTeam?.goalFor! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalFor! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].homeTeam?.goalBy! += Int(awayScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.goalBy! += Int(homeScore!)!
                self.fixtures?[self.lastIndex].awayTeam?.points! += 1
                self.fixtures?[self.lastIndex].homeTeam?.points! += 1
            }
            self.fixtures?[self.lastIndex].score = [Int(homeScore!)!, Int(awayScore!)!]
            self.fixturesTV.reloadData()
        }
    }
}

extension FixturesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fixturesTV.dequeueReusableCell(withIdentifier: "FixtureTableCell", for: indexPath) as? FixtureTableCell
        
        let hSocre = (fixtures?[indexPath.row].score?[0] == -1 ) ? "" : String((fixtures?[indexPath.row].score?[0])!) + " - "
        
        let aScore = (fixtures?[indexPath.row].score?[1] == -1 ) ? "" : " - " + String((fixtures?[indexPath.row].score?[1])!)
        
        cell?.fixtureHomeTeam.text = (hSocre + (fixtures?[indexPath.row].homeTeam?.name)!)
        cell?.fixtureAwayTeam.text = ((fixtures?[indexPath.row].awayTeam?.name)! + aScore)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastIndex = indexPath.row
        popup?.showPopup(fixture: fixtures?[indexPath.row])
    }
}

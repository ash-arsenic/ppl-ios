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
}

class FixturesVC: UIViewController {
    
//    Vars and Outlets
    @IBOutlet weak var fixturesTV: UITableView!
    var fixtures: [Fixtures]?
    var popup: MatchDetailsPopup?
    
//    Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fixturesTV.delegate = self
        fixturesTV.dataSource = self
        popup = MatchDetailsPopup()
    }

    @IBAction func updateTableFAction(_ sender: Any) {
        
    }
    
}

extension FixturesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fixturesTV.dequeueReusableCell(withIdentifier: "FixtureTableCell", for: indexPath) as? FixtureTableCell
        cell?.fixtureHomeTeam.text = fixtures?[indexPath.row].homeTeam?.name
        cell?.fixtureAwayTeam.text = fixtures?[indexPath.row].awayTeam?.name
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fixtures?[indexPath.row].homeTeam?.name)
        popup?.showPopup(fixture: fixtures?[indexPath.row])
    }
}

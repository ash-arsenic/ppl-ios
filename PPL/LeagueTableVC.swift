//
//  LeagueTableVC.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

class LeagueTableVC: UIViewController {
    
//    Vars and outlets
    @IBOutlet weak var leagueTableTV: UITableView!
    var teams: [TeamModel]?
    var fixtures: [Fixtures]?
    
//  Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueTableTV.delegate = self
        leagueTableTV.dataSource = self
        setUpFixtures()
        closureDefinition()
        sortTeams()
    }

    @IBAction func updateTableAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FixturesVC") as? FixturesVC
        vc?.fixtures = self.fixtures
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func closureDefinition() {
        FixturesVC.updateFixtureAction = { fixtures in
            for i in fixtures {
                for j in 0..<(self.teams?.count)!{
                    if self.teams?[j].name == i.homeTeam?.name {
                        self.teams?[j] = i.homeTeam!
                    }
                    if self.teams?[j].name == i.awayTeam?.name {
                        self.teams?[j] = i.awayTeam!
                    }
                }
            }
            self.fixtures = fixtures
            self.sortTeams()
            self.leagueTableTV.reloadData()
        }
    }
    
    func setUpFixtures() {
        fixtures = []
        for i in 0..<(teams?.count ?? 0) {
            for j in 0..<(teams?.count ?? 0) {
                if j == i {
                    continue
                }
                fixtures?.append(Fixtures(homeTeam: teams?[i], awayTeam: teams?[j], score: [-1, -1]))
            }
        }
    }
    
    func sortTeams() {
        teams = teams?.sorted {($0.points)! > ($1.points)!}
    }
}

extension LeagueTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableTV.dequeueReusableCell(withIdentifier: "LeagueTableCell", for: indexPath) as? LeagueTableCell
        cell?.leaguePositionLB.text = String(indexPath.row + 1)
        cell?.leagueTeamLB.text = teams?[indexPath.row].name
        cell?.teamWinLB.text = String(teams?[indexPath.row].wins ?? 0)
        cell?.teamLoseLB.text = String(teams?[indexPath.row].loses ?? 0)
        cell?.teamDrawLB.text = String(teams?[indexPath.row].draws ?? 0)
        cell?.teamGDLB.text = String(teams?[indexPath.row].gd ?? 0)
        cell?.teamPointsLB.text = String(teams?[indexPath.row].points ?? 0)
        return cell!
    }
    
}

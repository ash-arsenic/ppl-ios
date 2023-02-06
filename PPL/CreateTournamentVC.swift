//
//  CreateTournamentVC.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

struct Tournament {
    var name: String?
    var teams: [TeamModel]?
}

class CreateTournamentVC: UIViewController, CreateTournamentProtocol {

//    Variables and Outlets
    
    @IBOutlet weak var tournamentsTV: UITableView!
    
    var tournaments: [Tournament]?
    
//    Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentsTV.delegate = self
        tournamentsTV.dataSource = self
    }
    
    @IBAction func createTournament(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewTournamentVC") as? NewTournamentVC
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func updateCreateTournamentList(tournament: Tournament?) {
        if let tourn = tournaments {
            tournaments?.append(tournament!)
        } else {
            tournaments = [Tournament()]
            tournaments?.append(tournament!)
            tournaments?.remove(at: 0)
        }
        tournamentsTV.reloadData()
    }
    
}

extension CreateTournamentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tournamentsTV.dequeueReusableCell(withIdentifier: "tournament-cell", for: indexPath)
        cell.textLabel?.text = tournaments?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LeagueTableVC") as? LeagueTableVC
        vc?.teams = tournaments?[indexPath.row].teams
        navigationController?.pushViewController(vc!, animated: true)
    }
}

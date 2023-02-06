//
//  NewTournamentVC.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import UIKit

protocol CreateTournamentProtocol {
    func updateCreateTournamentList(tournament: Tournament?);
}

class NewTournamentVC: UIViewController {
//      Variable and Outlets
    
    @IBOutlet weak var tournamentNameTF: UITextField!
    
    @IBOutlet weak var teamNameTF: UITextField!
    
    @IBOutlet weak var addedTeamsTV: UITableView!
    
    var addedTeams: [TeamModel]?
    var delegate: CreateTournamentProtocol? = nil

//      Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        addedTeamsTV.delegate = self
        addedTeamsTV.dataSource = self
    }
    
    @IBAction func addTeamAction(_ sender: Any) {
        if let teams = addedTeams {
            let t = TeamModel(data: ["name": teamNameTF.text ?? "NA"])
            addedTeams?.append(t)
        } else {
            addedTeams = [TeamModel(data: [:])]
            let t = TeamModel(data: ["name": teamNameTF.text ?? "NA"])
            addedTeams?.append(t)
            addedTeams?.remove(at: 0)
        }
        teamNameTF.text = ""
        addedTeamsTV.reloadData()
    }
    
    @IBAction func createTournamentAction(_ sender: Any) {
        let tournament = Tournament(name: tournamentNameTF.text ?? "NA", teams: addedTeams)
        self.delegate?.updateCreateTournamentList(tournament: tournament)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

extension NewTournamentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedTeams?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addedTeamsTV.dequeueReusableCell(withIdentifier: "team_name", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = addedTeams?[indexPath.row].name ?? "NA"
        return cell
    }
}

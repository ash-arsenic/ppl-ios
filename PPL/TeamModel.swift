//
//  TeamModel.swift
//  PPL
//
//  Created by Rapipay Macintoshn on 06/02/23.
//

import Foundation
import UIKit

class TeamModel {
    var name: String?
    var wins: Int?
    var loses: Int?
    var draws: Int?
    var goalFor: Int?
    var goalBy: Int?
    var gd: Int?
    var points: Int?
    
    init(data: [String: Any]) {
        if let name = data["name"] as? String {
            self.name = name
        }
        if let wins = data["wins"] as? Int {
            self.wins = wins
        } else {
            self.wins = 0
        }
        
        if let loses = data["loses"] as? Int {
            self.loses = loses
        } else {
            self.loses = 0
        }
        
        if let draws = data["draws"] as? Int {
            self.draws = draws
        } else {
            self.draws = 0
        }
        
        if let goalFor = data["goalFor"] as? Int {
            self.goalFor = goalFor
        } else {
            self.goalFor = 0
        }
        
        if let goalBy = data["goalBy"] as? Int {
            self.goalBy = goalBy
        } else {
            self.goalBy = 0
        }
        
        if let gd = data["gd"] as? Int {
            self.gd = gd
        } else {
            self.gd = 0
        }
        
        if let points = data["points"] as? Int {
            self.points = points
        } else {
            self.points = 0
        }
        
    }
}

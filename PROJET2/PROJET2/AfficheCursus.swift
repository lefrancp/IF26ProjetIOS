//
//  AfficheCursus.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 08/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class AfficheCursus: UITableViewController {
    
    var identifiantModuleCellule = "d"
    var listeCursus: [Cursus] = []
    
    var listeCursusSigle = [String : [Cursus]]()
    var listeSigle : [String] = []
    let bdd = CursusBDD.shared;
    var numeroEtu: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listeCursus = bdd.selectCursusByNumEtu(numEtu: numeroEtu)
        
        for cursus in listeCursus {
            if(!listeSigle.contains(cursus.sigle)) {
                listeSigle.append(cursus.sigle)
                listeCursusSigle[cursus.sigle] = []
            }
            listeCursusSigle[cursus.sigle]?.append(cursus)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeCursus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "d", for: indexPath)
        
        print("indexpath " , indexPath.row)
        print ("ListeCursus dans  table view size ", listeCursus.count)
        let cursus = listeCursus[indexPath.row]
        cell.textLabel?.text = String(cursus.semestre)
        cell.detailTextLabel?.text = cursus.sigle + " " + cursus.resultat + " " + cursus.affectation
        
        //cell.textLabel?.text = "Cellule \(indexPath.row)"
        //cell.detailTextLabel?.text = "Section \(indexPath.section)"
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listeCursus[indexPath.row].sigle)
        tableView.deselectRow(at: indexPath, animated: true)
        
        bdd.deleteCursus(rowid:listeCursus[indexPath.row].sigle)
        listeCursus.remove(at: indexPath.row)
        tableView.reloadData()
    }*/
}

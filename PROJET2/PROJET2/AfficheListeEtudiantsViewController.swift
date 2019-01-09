//
//  AfficheListeEtudiantsViewController.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 07/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class AfficheListeEtudiantsViewController: UITableViewController {
    
    var identifiantModuleCellule = "c​​"
    var listeEtudiants: [Etudiant] = []
    
    var listeEtudiantNom = [String : [Etudiant]]()
    var listeNom : [String] = []
    let bdd = EtudiantBDD.shared;
    var numEtu = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
listeEtudiants = bdd.selectAll()
        
        for etudiant in listeEtudiants {
            if(!listeNom.contains(etudiant.nom)) {
                listeNom.append(etudiant.nom)
                listeEtudiantNom[etudiant.nom] = []
            }
            listeEtudiantNom[etudiant.nom]?.append(etudiant)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeEtudiants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "c", for: indexPath)
        
        print("indexpath " , indexPath.row)
        print ("ListeEtudiant dans  table view size ", listeEtudiants.count)
        let etudiant = listeEtudiants[indexPath.row]
        cell.textLabel?.text = String(etudiant.numeroEtu)
        cell.detailTextLabel?.text = etudiant.nom + " " + etudiant.prenom + " " + etudiant.admission + " " + etudiant.filiere
        
        //cell.textLabel?.text = "Cellule \(indexPath.row)"
        //cell.detailTextLabel?.text = "Section \(indexPath.section)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is AfficheCursus
        {
            let vc = segue.destination as? AfficheCursus
            let num = numEtu
            vc?.numeroEtu = num
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listeEtudiants[indexPath.row].nom)
        tableView.deselectRow(at: indexPath, animated: true)
        numEtu = listeEtudiants[indexPath.row].numeroEtu
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

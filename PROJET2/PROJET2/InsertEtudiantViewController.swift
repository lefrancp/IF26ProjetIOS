//
//  InsertEtudiantViewController.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 07/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class InsertEtudiantViewController: UIViewController {
    
    @IBOutlet weak var tf_numEtu: UITextField!
    @IBOutlet weak var tf_prenom: UITextField!
    @IBOutlet weak var tf_nom: UITextField!
    @IBOutlet weak var tf_admission: UITextField!
    @IBOutlet weak var tf_filiere: UITextField!
    
    let db = EtudiantBDD.shared;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func insertInTable() {
        
        let num = tf_numEtu.text
        let nom = tf_nom.text
        let prenom = tf_prenom.text
        let admission = tf_admission.text
        let filiere = tf_filiere.text
        
        db.insertEtudiant(numeroEtu: Int(num!)!, prenom: prenom!, nom: nom!, admission: admission!, filiere: filiere!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InsertCursusViewController
        {
            let vc = segue.destination as? InsertCursusViewController
            let num = tf_numEtu.text
            vc?.numEtu = Int(num!)!
        }
    }
}

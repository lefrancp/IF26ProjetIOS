//
//  InsertCursusViewController.swift
//  PROJET2
//
//  Created by LEFRANC Paul on 07/01/2019.
//  Copyright © 2019 LEFRANC Paul. All rights reserved.
//

import UIKit

class InsertCursusViewController: UIViewController {
    
    var numEtu: Int = 0
    //var numeroSemestre: Int = 1
    
    //@IBOutlet weak var numeroSemestrelabel: UILabel?
    
    @IBOutlet weak var sigleUE1: UITextField!
    @IBOutlet weak var labelSemestre: UITextField!
    @IBOutlet weak var resultatUE1: UITextField!
    @IBOutlet weak var affectationUE1: UITextField!
    @IBOutlet weak var sigleUE2: UITextField!
    @IBOutlet weak var sigleUE3: UITextField!
    @IBOutlet weak var sigleUE4: UITextField!
    @IBOutlet weak var sigleUE5: UITextField!
    @IBOutlet weak var sigleUE6: UITextField!
    @IBOutlet weak var sigleUE7: UITextField!
    @IBOutlet weak var sigleUE8: UITextField!
    @IBOutlet weak var resultatUE2: UITextField!
    @IBOutlet weak var resultatUE3: UITextField!
    @IBOutlet weak var resultatUE4: UITextField!
    @IBOutlet weak var resultatUE5: UITextField!
    @IBOutlet weak var resultatUE6: UITextField!
    @IBOutlet weak var resultatUE7: UITextField!
    @IBOutlet weak var resultatUE8: UITextField!
    @IBOutlet weak var affectationUE2: UITextField!
    @IBOutlet weak var affectationUE3: UITextField!
    @IBOutlet weak var affectationUE4: UITextField!
    @IBOutlet weak var affectationUE5: UITextField!
    @IBOutlet weak var affectationUE6: UITextField!
    @IBOutlet weak var affectationUE7: UITextField!
    @IBOutlet weak var affectationUE8: UITextField!
    
    @IBOutlet weak var numEtulabel: UILabel?
    
    let db = CursusBDD.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numEtulabel?.text = String(numEtu)
        //numeroSemestrelabel?.text = String(numeroSemestre)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InsertCursusViewController
        {
            
            let vc = segue.destination as? InsertCursusViewController
            let num = String(numEtu)
            vc?.numEtu = Int(num)!
            //let numSemestre = String(numeroSemestre)
            //vc?.numeroSemestre = Int(numSemestre)! + 1
        }
    }
    
    @IBAction func ajouterSemestre() {
        ajouterCursus()
        //c'est ici le + 1
    }
    
    @IBAction func terminerCursus() {
        ajouterCursus()
    }
    func ajouterCursus() {
        let num = String(numEtu)
        let label = labelSemestre.text
        let sigle1 = sigleUE1.text
        let sigle2 = sigleUE2.text
        let sigle3 = sigleUE3.text
        let sigle4 = sigleUE4.text
        let sigle5 = sigleUE5.text
        let sigle6 = sigleUE6.text
        let sigle7 = sigleUE7.text
        let sigle8 = sigleUE8.text
        let resultat1 = resultatUE1.text
        let resultat2 = resultatUE2.text
        let resultat3 = resultatUE3.text
        let resultat4 = resultatUE4.text
        let resultat5 = resultatUE5.text
        let resultat6 = resultatUE6.text
        let resultat7 = resultatUE7.text
        let resultat8 = resultatUE8.text
        let affectation1 = affectationUE1.text
        let affectation2 = affectationUE2.text
        let affectation3 = affectationUE3.text
        let affectation4 = affectationUE4.text
        let affectation5 = affectationUE5.text
        let affectation6 = affectationUE6.text
        let affectation7 = affectationUE7.text
        let affectation8 = affectationUE8.text
        
        db.insertCursus(numeroEtu: Int(num)!, sigle: sigle1!, resultat: resultat1!, semestre: label!, affectation: affectation1!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle2!, resultat: resultat2!, semestre: label!, affectation: affectation2!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle3!, resultat: resultat3!, semestre: label!, affectation: affectation3!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle4!, resultat: resultat4!, semestre: label!, affectation: affectation4!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle5!, resultat: resultat5!, semestre: label!, affectation: affectation5!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle6!, resultat: resultat6!, semestre: label!, affectation: affectation6!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle7!, resultat: resultat7!, semestre: label!, affectation: affectation7!)
                db.insertCursus(numeroEtu: Int(num)!, sigle: sigle8!, resultat: resultat8!, semestre: label!, affectation: affectation8!)
    
    }

}

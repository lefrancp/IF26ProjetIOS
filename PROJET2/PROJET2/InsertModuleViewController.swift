//
//  InsertModuleViewController.swift
//  ballin_tp10_modules
//
//  Created by Marie Ballin on 04/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit

class InsertModuleViewController: UIViewController {

    @IBOutlet weak var tf_sigle: UITextField!
    @IBOutlet weak var tf_categorie: UITextField!
    @IBOutlet weak var tf_parcours: UITextField!
    @IBOutlet weak var tf_credit: UITextField!
    
    let bdd = SingletonBdd.shared;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func insertInTable() {
        let sigle = tf_sigle.text
        let categorie = tf_categorie.text
        let parcours = tf_parcours.text
        let credit = tf_credit.text
        
        bdd.insertModule(sigle: sigle!, parcours: parcours!, categorie: categorie!, credit: Int(credit!)!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

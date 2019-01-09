//
//  ViewController.swift
//  ballin_tp10_modules
//
//  Created by Marie Ballin on 04/12/2018.
//  Copyright © 2018 if26. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    @IBOutlet weak var bt_create: UIButton!
    @IBOutlet weak var bt_insert: UIButton!
    
    
    let bdd = EtudiantBDD.shared;
    let bddCursus = CursusBDD.shared
        var tableEtuExist = false
        var tableCursusExist = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !self.tableEtuExist {
            self.tableEtuExist = true
                bdd.createTable()
            sqlite3_close(nil)
        }
        if !self.tableCursusExist {
            self.tableCursusExist = true
            bddCursus.createTable()
            sqlite3_close(nil)
        }
    }
    
}


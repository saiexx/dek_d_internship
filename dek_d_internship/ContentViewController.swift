//
//  ContentViewController.swift
//  dek_d_internship
//
//  Created by Sai-Mork on 2/10/19.
//  Copyright © 2019 Kasidid Wachirachai. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var content: Content?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = content!.name
        descLabel.text = content!.desc
    }



}

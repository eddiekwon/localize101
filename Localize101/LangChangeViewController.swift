//
//  LangChangeViewController.swift
//  Localize101
//
//  Created by muzna on 2021/03/21.
//

import UIKit

class LangChangeViewController: UIViewController{
    
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLanuguage(langAbbr: "ko")
    }
}

//
//  ViewController.swift
//  Lab Work
//
//  Created by Akshit Goyal on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        label.text = textField.text
    }
    
    @IBAction func clearTextButtonField(_ sender: UIButton) {
        label.text = "PlaceHolder"
        textField.text = ""
    }
    
}

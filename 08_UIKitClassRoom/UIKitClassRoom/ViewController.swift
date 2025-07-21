//
//  ViewController.swift
//  UIKitClassRoom
//
//  Created by Akshit Goyal on 15/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var volumeToggle: UISlider!
    @IBOutlet weak var reviewToggle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //    @IBAction func switchToggle(_ sender: UISwitch) {
    //        if sender.isOn {
    //            print("Wifi is ON")
    //        } else {
    //            print("Wifi is OFF")
    //        }
    //    }
    //
    //    @IBAction func volumeToggle(_ sender: UISlider) {
    //        print(sender.value)
    //    }
    //    @IBAction func reviewEdited(_ sender: UITextField) {
    ////        if let text = sender.text {
    ////            print(text)
    ////        }
    //    }
    //    @IBAction func keyboardReturnKeyPressed(_ sender: UITextField) {
    //        if let text = sender.text {
    //            print(text)
    //        }
//    }
    
    @IBAction func buttonToggle(_ sender: UIButton) {
        if switchToggle.isOn {
            print("ON")
        } else {
            print("OFF")
        }
        print(volumeToggle.value)
    }
}

//
//  SecondViewController.swift
//  NewStuff
//
//  Created by Caleb Price on 11/16/19.
//  Copyright © 2019 Caleb Price. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
   
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var NameOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func OnCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

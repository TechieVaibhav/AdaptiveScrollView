//
//  SelectedViewController.swift
//  EffectivePageScroll
//
//  Created by Mohit Shrama on 15/09/19.
//  Copyright © 2019 vaibhav sharma. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {
    var selectedCategory : String?
    
    @IBOutlet weak var lblSelectedCategory: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblSelectedCategory.text = "You have selected " + (selectedCategory ?? "")
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
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

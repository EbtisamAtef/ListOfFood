//
//  SecondViewController.swift
//  ListOfFood
//
//  Created by Ebtisam on 11/8/18.
//  Copyright © 2018 Ebtisam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var SingleItem:FoodItem?
    
    @IBOutlet weak var laimage: UIImageView!
    
    @IBOutlet weak var laname: UILabel!
    
    @IBOutlet weak var ladesc: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laname.text = SingleItem?.Name!
        ladesc.text = SingleItem?.desc!
        laimage.image = UIImage(named:(SingleItem?.image!)!)
        
    }
    
    @IBAction func Back(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
        
    }

}

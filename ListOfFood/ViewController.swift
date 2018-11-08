//
//  ViewController.swift
//  ListOfFood
//
//  Created by Ebtisam on 11/8/18.
//  Copyright © 2018 Ebtisam. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource {
    var FoodList = Array<FoodItem>()
    
    
    
    @IBOutlet weak var collectionViewlist: UICollectionView!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReadFromPlist()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.laName.text = FoodList[indexPath.row].Name!
        cell.myimage.image = UIImage (named:FoodList[indexPath.row].image! )
        
        return cell
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowDetails", sender: FoodList[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination as? SecondViewController{
            
            if let Food = sender as? FoodItem{
                
                dis.SingleItem = Food
                
            }
            
            
        }
    }
    
    
    
    
    
    
    func ReadFromPlist()  {
        //1-get path from object file
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")
        //2- take url (phone) from path
        let url = URL (fileURLWithPath: path!)
        // 3- read data from url
        let data = try! Data(contentsOf: url)
        // 4- convert dta to information to read
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        // convert array to dictionary
        let dictArray = plist as! [[String:String]]
        
        for dict in dictArray {
            
            
            FoodList.append(FoodItem(Name: dict["Name"]!, image: dict ["Image"]!, desc: dict["Des"]!))
            
            
        }
        
        
        
    }
    
    
    
    
    
}


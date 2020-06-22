//
//  ViewController.swift
//  NYT
//
//  Created by Владислав on 6/22/20.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    var categoryArray = ["Arts", "Car", "World", "Education"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.tableFooterView = UIView()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SequeToArticles"{
            if let vc = segue.destination as? ArticlesViewController {
                let category = sender as? String
                vc.category = category
            }
        }
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categoryTableView.dequeueReusableCell(withIdentifier: "Cell")  {
            
            let category = categoryArray[indexPath.row]
            cell.textLabel?.text = category

            return cell
            
        }
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryArray[indexPath.row]
        self.performSegue(withIdentifier: "SequeToArticles", sender: category)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

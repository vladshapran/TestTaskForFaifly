//
//  ArticlesViewController.swift
//  NYT
//
//  Created by Владислав on 6/22/20.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articlesData: MyObject?
    var category: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
        
    }
    
    //MARK: - Dowloanding data from the site
    func load()  {
        
        guard let dowloandURL = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(String(describing: category!)))&api-key=AbZcgTvAissWBuBHmNDXOUEKHDWo7Du4")  else {return}
        URLSession.shared.dataTask(with: dowloandURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {return}
            do {
                let dowloandedArticles = try JSONDecoder().decode(MyObject.self, from: data)
                self.articlesData = dowloandedArticles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{ print("ERROR - \(error)")}
        }.resume()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticlesNYT"{
            if let vc = segue.destination as? ArticleNYTViewController {
                let url = sender as? String
                vc.url = url
            }
        }
    }
    

}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesData?.response.docs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleSelectionCell") else {return UITableViewCell()}
        
            let articles = articlesData?.response.docs[indexPath.row].headline.main
            cell.textLabel?.text = articles
        
            return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articles = articlesData?.response.docs[indexPath.row].web_url
        self.performSegue(withIdentifier: "ArticlesNYT", sender: articles)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
    



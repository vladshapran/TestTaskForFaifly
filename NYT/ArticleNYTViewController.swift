//
//  ArticleNYTViewController.swift
//  NYT
//
//  Created by Владислав on 6/22/20.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit
import WebKit

class ArticleNYTViewController: UIViewController {

    @IBOutlet var webView: WKWebView!

    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Display html file
        webView.load(URLRequest(url: URL(string: url!)!))
    }
    
}

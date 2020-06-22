//
//  Model.swift
//  NYT
//
//  Created by Владислав on 6/22/20.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation


//MARK: -Creating structures according to the Parsing
struct MyObject: Decodable {
    var status: String
    var copyright: String
    var response: Response
}

struct Response: Decodable {
    var docs: [Article]
}

struct Article: Decodable {
    
    var lead_paragraph: String
    var headline: Headline
    var web_url: String
}


struct Headline: Decodable {
    var main: String
}



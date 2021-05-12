//
//  Article.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import Foundation

struct Article: Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}

//
//  ArticleModel.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
    
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and delegate pattern
        delegate?.articlesRetrieved([Article]())
        
    }
    
}

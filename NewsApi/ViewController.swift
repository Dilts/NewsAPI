//
//  ViewController.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import UIKit

class ViewController: UIViewController, ArticleModelProtocol {

    var model = ArticleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }

    //MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        print("articles returned from model")
    }
    
    
}


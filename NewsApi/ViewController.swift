//
//  ViewController.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
    
    
}

extension ViewController: ArticleModelProtocol {
    
    //MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the articles of the view ontroller to the articles passed back from the model
        self.articles = articles
    }
    
    
}

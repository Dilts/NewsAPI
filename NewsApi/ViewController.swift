//
//  ViewController.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the viewController as the data source and delegate of the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        // TODO: Customize it
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}

extension ViewController: ArticleModelProtocol {
    
    //MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the articles of the view ontroller to the articles passed back from the model
        self.articles = articles
        
        // Refreash the tableView
        tableView.reloadData()
    }
    
    
}


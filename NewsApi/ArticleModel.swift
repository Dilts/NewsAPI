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
        
        // Create API Key constant
        let apiKey = "dfd45d870a4948cf8f2be055c0f65e0b"
        // Create a string url
        let stringUrl = "https://newsapi.org/v2/everything?q=tesla&from=2021-04-12&sortBy=publishedAt&apiKey=" + apiKey
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, res, err) in
            
            // Check that there are no errors and there is data
            if err == nil && data != nil {
                
                // attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    // PArse the JSON into article service
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                    
                }catch {
                    print("Could not parse JSON")
                } // End Do Catch
                
            } // End if
            
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
        
    }
    
    
}

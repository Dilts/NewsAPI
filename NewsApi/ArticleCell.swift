//
//  ArticleCell.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import UIKit

class ArticleCell: UITableViewCell {

    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
  
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        // Clean up the cell before displaying the next article
        articleImageView.image = nil
        headlineLabel.text = ""
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Download and display the image
        
        // Check that the article actually has an image
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        // Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the casche manager before downloading any image data
        if let imageData = CacheManager.retrieveData(urlString) {
            
            // There is image data in cache, set the image view and return
            articleImageView.image = UIImage(data: imageData)
            return
        }
        
        // Create the url
        let url = URL(string: urlString)
        
        // Check that the url is not nil
        guard url != nil else {
            print("Couldn't create url object for image")
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Create the dataTask
        let dataTask = session.dataTask(with: url!) { (data, res, err) in
            
            // Check that there are no erros
            if err == nil && data != nil {
                
                // Save the data into cache
                CacheManager.saveData(urlString, data!)
                
                // Check if the urlString that the data task went off to download matches the article the cell is set to display
                if self.articleToDisplay?.urlToImage == urlString {
                    DispatchQueue.main.async {
                        // Display the image in the imageView
                        self.articleImageView.image = UIImage(data: data!)
                    }
                }
                
                
            } // End if
            
        } // End dataTask
        
        // Kick off the DataTask
        dataTask.resume()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  DetailViewController.swift
//  NewsApi
//
//  Created by Brian Dilts on 5/12/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Check that there is a url
        if articleUrl != nil {
         
            // Create the url object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                // Couldnt' create URL object
                return
            }
            
            // Create the URLRequest object
            let request = URLRequest(url: url!)
            
            // Load it in the webview
            webView.load(request)
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

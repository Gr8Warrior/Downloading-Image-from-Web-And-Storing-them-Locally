//
//  ViewController.swift
//  Downloading Images From The Web
//
//  Created by Shailendra Suriyal on 17/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loaded")
        //Steps
        
        //1 Create an Url
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/260px-Johann_Sebastian_Bach.jpg")!
        
        //2 Create a request
        let request = NSMutableURLRequest(url: url)
        
        //3 Create a task
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            
            data, response, error in
            
            if error != nil {
                
                print("error occured while downloading data")
                
            } else {
                
                if let data = data {
                    
                    if let image = UIImage(data: data) {
                        
                        self.imageView.image = image;
                        
                    }
                }
                
            }
            
        })
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


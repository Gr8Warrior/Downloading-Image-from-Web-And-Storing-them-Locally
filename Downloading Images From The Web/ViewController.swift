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
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/4/49/A_R_Rahman_NH7_BLR_2015_1.jpg/800px-A_R_Rahman_NH7_BLR_2015_1.jpg")!
        
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
                        
                        //get Documents path where we'll save all our documents
                        
                        //domain MAsk :- where we are searching for our file
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)
                        
                        if documentsPath.count > 0 {
                            
                            let documentsDirectory = documentsPath[0]
                            
                            //Save path :- where we'll store the image
                            let savePath = documentsDirectory + "/a-r-rahman.jpg"
                            
                            //Save Image
                            do {
                                
                                try UIImageJPEGRepresentation(image, 1)!.write(to: URL(fileURLWithPath: savePath))
                                
                            } catch {
                                
                                //Error writing Image
                                
                            }
                        }
                        
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


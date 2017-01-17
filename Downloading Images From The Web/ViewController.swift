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
        
        //domain MAsk :- where we are searching for our file
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)
        
        if documentsPath.count > 0 {
            
            let documentsDirectory = documentsPath[0]
            
            //Save path :- where we'll store the image
            let restorePath = documentsDirectory + "/shailu_suriyal.jpg"
            
            let fileManager = FileManager.default
            
            if fileManager.fileExists(atPath: restorePath) { // Read Image from local if path is there
                print("FILE AVAILABLE")
                //retrieve Image
                imageView.image = UIImage(contentsOfFile: restorePath)

            } else {    //Download from Web
                print("FILE NOT AVAILABLE, Downloading from Web")
                
                
                //Steps
                
                //1 Create an Url
                let url = URL(string: "https://scontent.fblr2-1.fna.fbcdn.net/v/t1.0-9/15672922_10206053457974244_4569978158784502299_n.jpg?oh=99eaa95a0b1e84a068c4dcb3425c02fb&oe=58DCFF14")!
                
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
                                    let savePath = documentsDirectory + "/shailu_suriyal.jpg"
                                    
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
            
            
        }
        
//        
//        
//        //Steps
//        
//        //1 Create an Url
//        let url = URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/4/49/A_R_Rahman_NH7_BLR_2015_1.jpg/800px-A_R_Rahman_NH7_BLR_2015_1.jpg")!
//        
//        //2 Create a request
//        let request = NSMutableURLRequest(url: url)
//        
//        //3 Create a task
//        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
//            
//            data, response, error in
//            
//            if error != nil {
//                
//                print("error occured while downloading data")
//                
//            } else {
//                
//                if let data = data {
//                    
//                    if let image = UIImage(data: data) {
//                        
//                        self.imageView.image = image;
//                        
//                        //get Documents path where we'll save all our documents
//                        
//                        //domain MAsk :- where we are searching for our file
//                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)
//                        
//                        if documentsPath.count > 0 {
//                            
//                            let documentsDirectory = documentsPath[0]
//                            
//                            //Save path :- where we'll store the image
//                            let savePath = documentsDirectory + "/a-r-rahman.jpg"
//                            
//                            //Save Image
//                            do {
//                                
//                                try UIImageJPEGRepresentation(image, 1)!.write(to: URL(fileURLWithPath: savePath))
//                                
//                            } catch {
//                                
//                                //Error writing Image
//                                
//                            }
//                        }
//                        
//                    }
//                }
//                
//            }
//            
//        })
//        
//        task.resume()
//        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


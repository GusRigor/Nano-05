//
//  ViewController.swift
//  resizeViewTest
//
//  Created by Gustavo Rigor on 12/02/21.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //imageView.transform = CGAffineTransform(scaleX: 5, y: 5)
        
    }
    
    @IBAction func reorganizar(_ sender: Any) {
        //        UIView.animate(withDuration: 1.5, animations: {
        //            self.imageView.transform = CGAffineTransform(scaleX: 10, y: 10)
        //            //self.imageView.transform = CGAffineTransform(rotationAngle: 3.14)
        //            //self.imageView.transform = CGAffineTransform(translationX: 25, y: 25)
        //
        //        })
        
        for _ in 0 ... 10{
            UIView.animate(withDuration: 0.5, animations: {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 10)
                
                UIView.animate(withDuration: 1.5, animations: {
                    self.imageView.transform = CGAffineTransform(scaleX: -1, y: -1)
                    //self.imageView.transform = CGAffineTransform(rotationAngle: 3.14)
                    //self.imageView.transform = CGAffineTransform(translationX: 25, y: 25)
                    UIView.animate(withDuration: 1.5, animations: {
                        self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        //self.imageView.transform = CGAffineTransform(rotationAngle: 3.14)
                        //self.imageView.transform = CGAffineTransform(translationX: 25, y: 25)
                        
                    })
                    
                })
            })
            
            
        }
       
        
        
        //imageView.transform = CGAffineTransform(scaleX: 5, y: 5)
        //
        //imageView.transform = CGAffineTransform.identity
        
        Label.text = "Feito"
    }
    
}


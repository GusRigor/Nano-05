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
        imageView.image = UIImage(named: "lua.png")
//        imageView.tintColor = .blue
        // Do any additional setup after loading the view.
        //imageView.transform = CGAffineTransform(scaleX: 5, y: 5)
        
    }
    
    @IBAction func reorganizar(_ sender: Any) {
        
        self.perform(#selector(changeImageColorToYellow), with: nil, afterDelay: 2.5)
        
        for _ in 0 ... 10{
            UIView.animate(withDuration: 0.5, animations: {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 10)
                
                UIView.animate(withDuration: 1.5, animations: {
                    self.imageView.transform = CGAffineTransform(scaleX: -1, y: -1)
                    
                    UIView.animate(withDuration: 1.5, animations: {
                        self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    })
                    
                })
            })
            
            
        }
        
        Label.text = "Feito"
    }
    @objc func changeImageColorToYellow (){
         let templateImage = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.image = templateImage
            imageView.tintColor = UIColor.yellow
        }
    
}


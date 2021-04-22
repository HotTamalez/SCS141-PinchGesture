//
//  ViewController.swift
//  InClassPinchGesture
//
//  Created by zweakland on 4/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // call the tap gesture method
        // transformImage()
        // call the pinch method
        pinchImage()
        
    }
    
    // pinch gesture method
    func pinchImage(){
        imageView.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(sender:)))
        
        imageView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinch(sender: UIPinchGestureRecognizer){
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    

    // tap gesture method
    func transformImage(){
        
        imageView.isUserInteractionEnabled = true
        
        // create tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(recognizer:)))
        // how many taps to start method
        tapGesture.numberOfTapsRequired = 2
        
        imageView.addGestureRecognizer(tapGesture)
    }
    
    // functionality when I tap the image
    @objc func tap(recognizer:UITapGestureRecognizer){
        
        // using multiple transform methods
        var transformImageView = CGAffineTransform.identity
        
        transformImageView = transformImageView.scaledBy(x: 2, y: 2)
        transformImageView = transformImageView.rotated(by: 45)
        transformImageView = transformImageView.translatedBy(x: -50, y: -50)
        
        imageView.transform = transformImageView
        
        // change the size of the image view
        // imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        // change the angle of our image view
        // imageView.transform = CGAffineTransform(rotationAngle: 45)
        // change the position of the image view
        // imageView.transform = CGAffineTransform(translationX: -50, y: -50)

    }
    

}


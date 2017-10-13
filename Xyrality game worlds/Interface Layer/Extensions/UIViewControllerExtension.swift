//
//  UIViewControllerExtension.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable{
    
    func showMessage(message: String, responce: String){
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: responce, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startAnimating() {
        
        let size = CGSize(width: 30, height: 30)
        
        startAnimating(size, message: "", type: .lineScale)
    }
}

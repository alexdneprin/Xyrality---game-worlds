//
//  LoginViewController.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets -

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - UIViewController Methods -
    //***************************************************
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Private -
    //***************************************************
    
    func configureViewController() {
        
        self.loginTextField.text = Constants.userLogin
        self.passwordTextField.text = Constants.userPassword
    }
    
    
    // MARK: - Actions -
    //***************************************************
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if (loginTextField.text != "" && passwordTextField.text != ""){

            self.startAnimating()

            weak var weakSelf = self
            
            OperationQueue.main.addOperation({ () -> Void in
                NetworkManager.shared.getAllAvailableWorlds(login: (weakSelf?.loginTextField.text)!, password: (weakSelf?.passwordTextField.text)!, completionBlock: { (gameWorlds) in
                    weakSelf?.stopAnimating()
                    weakSelf?.showListOfGameWorlds(worldsList: gameWorlds)
                })
            })
        } else {
            self.showMessage(message: Constants.fieldIsEmptyMessage, responce: Constants.fieldIsEmptyAnswer)
        }
    }
    
    func showListOfGameWorlds(worldsList: [GameWorld]){
        
        let storyboard = UIStoryboard(name: Constants.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: GameWorldsViewController.self)) as? GameWorldsViewController
        
        viewController?.gameWorldsList = worldsList
        navigationController?.pushViewController(viewController!, animated: true)
    }
}




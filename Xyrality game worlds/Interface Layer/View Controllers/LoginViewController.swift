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
        
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.loginTextField.text = Constants.userLogin
        self.passwordTextField.text = Constants.userPassword

    }
    
    
    // MARK: - Actions -
    //***************************************************
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.loadListOfGameWorlds(loginString: loginTextField.text!, passwordString: passwordTextField.text!)
    }
    
    func loadListOfGameWorlds(loginString: String, passwordString: String){
        
        guard (loginString != "" && passwordString != "") else {
            self.showMessage(message: Constants.fieldIsEmptyMessage, responce: Constants.fieldIsEmptyAnswer)
            return
        }
        
        self.startAnimating()
        
        NetworkManager.shared.getAllAvailableWorlds(login: loginString, password: passwordString, completionBlock: { [weak self] (gameWorlds) in
            guard let `self` = self else { return }
            self.stopAnimating()
            self.showListOfGameWorlds(worldsList: gameWorlds)
        })
    }
    
    func showListOfGameWorlds(worldsList: [GameWorld]){
        
        let storyboard = UIStoryboard(name: Constants.main, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: GameWorldsViewController.self)) as? GameWorldsViewController
        
        viewController?.gameWorldsList = worldsList
        navigationController?.pushViewController(viewController!, animated: true)
    }
}


// MARK: - UITextFieldDelegate -
//***************************************************


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case self.loginTextField:
            self.passwordTextField.becomeFirstResponder()
            return false
            
        case self.passwordTextField:
            self.loadListOfGameWorlds(loginString: loginTextField.text!, passwordString: passwordTextField.text!)
            textField.endEditing(true)
            return true
            
        default:
            return true
        }
    }
    
}

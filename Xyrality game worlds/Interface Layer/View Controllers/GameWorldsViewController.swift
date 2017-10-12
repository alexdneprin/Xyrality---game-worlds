//
//  GameWorldsViewController.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import UIKit

class GameWorldsViewController: UIViewController {

    public var gameWorldsList = [GameWorld]()
    
    //MARK: - Outlets -

    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - UIViewController Methods -
    //***************************************************
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func initWithWorldsList(worldsList: [GameWorld]){
        self.gameWorldsList = worldsList
    }
    
    
    //MARK: - Actions -
    //***************************************************

    
    @IBAction func showAvailableWorldsButtonPressed(_ sender: Any) {
        
        var availableWorlds = [GameWorld]()
        
        for world in self.gameWorldsList{
            if world.online == true{
                availableWorlds.append(world)
            }
        }
        
        self.gameWorldsList = availableWorlds
        self.tableView.reloadData()
        
        showMessage(message: Constants.completeMessage, responce: Constants.okMessage)
    }
    
    deinit {
        print("deinit called")
    }
}

//MARK: - UITableView DataSource & Delegate -
//***************************************************


extension GameWorldsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = gameWorldsList[indexPath.row].name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameWorldsList.count
    }
}


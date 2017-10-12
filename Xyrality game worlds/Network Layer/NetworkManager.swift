//
//  NetworkManager.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    
    //MARK: - Init -
    //***************************************************
    
    
    private init() { }
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    
    //MARK: - Login & Get Worlds List -
    //***************************************************
    
    
    func getAllAvailableWorlds(login: String, password: String, completionBlock: @escaping([GameWorld]) -> ()){
        
        let params: Dictionary = [Constants.loginParam: login, Constants.passwordParam: password, Constants.deviceTypeParam: Constants.deviceType, Constants.deviceIdParam: Constants.deviceId]
        let headers: Dictionary = [Constants.acceptHeader: Constants.applicationJSONDataType, Constants.contentTypeHeader: Constants.applicationJSONDataType]

        var urlComponent = URLComponents(string: Constants.baseURL)!
        let queryItems = params.map  { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems
        
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = Constants.post
        request.allHTTPHeaderFields = headers
        
        Alamofire.request(request).responseJSON { response in

            guard response.result.isSuccess else {
                print("\(Constants.errorFetchingData) \(String(describing: response.result.error))")
                return
            }
            
            guard let responseJSON = response.result.value as? [String: Any]
                else {
                    print(Constants.invalidInformationRecivedFromTheService)
                    return
            }
            
            let avalibleWordsArray: NSArray = responseJSON[JSONKeys.allAvailableWorlds] as! NSArray
            
            var worlds = [GameWorld]()
            
            for object in avalibleWordsArray {
                let world = GameWorld(withDictionary: object as? [String : Any])
                worlds.append(world)
            }

            completionBlock(worlds)
        }
    }
 
}

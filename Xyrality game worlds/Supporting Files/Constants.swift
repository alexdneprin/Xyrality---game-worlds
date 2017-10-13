//
//  Constants.swift
//  Xyrality game worlds
//
//  Created by Alexander Slobodjanjuk on 12.10.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import UIKit

struct Constants {

    
    //MARK: - Network Manager -
    //***************************************************
    
    static let baseURL = "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"
    
    static let post = "POST"

    static let loginParam = "login"
    static let passwordParam = "password"
    static let deviceTypeParam = "deviceType"
    static let deviceIdParam = "deviceId"
    
    static let acceptHeader = "Accept"
    static let contentTypeHeader = "Content-Type"
    static let applicationJSONDataType = "application/json"

    static let results = "results"


    //MARK: - Errors

    static let errorFetchingData = "Error while fetching data:"
    
    static let invalidInformationRecivedFromTheService = "Invalid information received from the service"

    
    //MARK: - UIViewControllers -
    //***************************************************
    
    static let userLogin = "ios.test@xyrality.com"
    static let userPassword = "password"
    
    static let fieldIsEmptyMessage = "Please fill in all fields"
    static let fieldIsEmptyAnswer = "Ok, I'll do it"
    static let completeMessage = "Complete"
    static let okMessage = "Ok"

    static let main = "Main"

    
    //MARK: - Other -
    //***************************************************
    
    static let deviceModel = UIDevice.current.model
    static let deviceSystem = UIDevice.current.systemName
    static let deviceName = UIDevice.current.systemVersion

    static let deviceId = UUID().uuidString
    static let deviceType = deviceModel + " - " + deviceSystem + " " + deviceName

}

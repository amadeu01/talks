//
//  AppDelegate.swift
//  Chinela
//
//  Created by Amadeu Cavalcante Filho on 30/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit
import ChinelaFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let driver = Driver(TodosApp())


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = driver.viewController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }
}


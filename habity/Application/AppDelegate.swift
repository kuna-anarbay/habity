//
//  AppDelegate.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/28/20.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    var window: UIWindow?
    var appFlowCoordinator: AppFlowCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        window?.rootViewController = navigationController
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,
                                                appDIContainer: appDIContainer)
        appFlowCoordinator?.start()
        window?.makeKeyAndVisible()
        
        return true
    }

}


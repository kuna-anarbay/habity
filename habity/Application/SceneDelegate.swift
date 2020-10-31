//
//  SceneDelegate.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/28/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let appDIContainer = AppDIContainer()
    var window: UIWindow?
    var appFlowCoordinator: AppFlowCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationController = UINavigationController()
            
            window.rootViewController = navigationController
            self.window = window
            appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,
                                                    appDIContainer: appDIContainer)
            appFlowCoordinator?.start()
            window.makeKeyAndVisible()
        }
        
    }



}


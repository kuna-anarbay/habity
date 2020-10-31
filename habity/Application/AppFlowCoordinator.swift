//
//  AppFlowCoordinator.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/28/20.
//

import UIKit


final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let authSceneDIContainer = appDIContainer.makeAuthSceneDIContainer()
        let flow = authSceneDIContainer.makeSignInCoordinator(navigationController: navigationController)
        flow.start()
    }
}

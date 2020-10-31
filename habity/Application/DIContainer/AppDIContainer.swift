//
//  AppDIContainer.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/28/20.
//

import UIKit

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    //MARK: Auth service
    lazy var authService: AuthService = DefaultAuthService()
    
    
    // MARK: - DIContainers of scenes
    func makeAuthSceneDIContainer() -> AuthSceneDIContainer {
        return AuthSceneDIContainer(authService: self.authService)
    }
    
}

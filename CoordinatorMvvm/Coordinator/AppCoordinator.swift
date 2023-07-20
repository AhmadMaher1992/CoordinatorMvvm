//
//  AppCoordinator.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 19/07/2023.
//

import UIKit

//------------------------------------------
// MARK: - Coordinator
//------------------------------------------
protocol Coordinator: AnyObject
{
    var childCoordinators: [Coordinator] { get }
    func start()
}


//------------------------------------------
// MARK: - AppCoordinator
//------------------------------------------
final class AppCoordinator: Coordinator
{
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    
    
    //------------------------------------------
    // MARK: - Initializer
    //------------------------------------------
    init(window: UIWindow)
    {
        self.window = window
    }
    
    
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    
    func start() {
        let navigationController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
    
}

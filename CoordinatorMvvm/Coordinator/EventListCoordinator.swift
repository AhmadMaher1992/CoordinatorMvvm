//
//  EventListCoordinator.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 19/07/2023.
//

import UIKit

final class EventListCoordinator: Coordinator
{
    
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    
    //------------------------------------------
    // MARK: - Initializer
    //------------------------------------------
    init(navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }
    
    
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    func start()
    {
        let eventListVC: EventListVC = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        eventListVC.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListVC], animated: true)//set eventListVC As aroot to navigationcontroller
    }
    
    
    func startAddEvent()
    {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
        
    }
    
    
    func chilDidFinish(_ childCoordinator: Coordinator)
    {
     
        if let index = childCoordinators.firstIndex(where: { $0 === childCoordinator })
        {
            print("DEBUG:☑️ Index ☑️ \(index) ☑️")
            childCoordinators.remove(at: index)
        }
        
//        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
//            return childCoordinator === coordinator
//        }){
//            print("DEBUG:☑️ Index ☑️ \(index) ☑️")
//            //childCoordinators.remove(at: index)
//        }
    }
    
    deinit
    {
        print("DEBUG:☑️ EventListCoordinator ❌ DEINIT ❌")
    }
    
}

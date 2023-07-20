//
//  AddEventCoordinator.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 20/07/2023.
//

import UIKit


final class AddEventCoordinator: Coordinator
{
    
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: EventListCoordinator?
    
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
        //create add event view controller
        let vc  = AddEventVC()
        //create add event view model
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        vc.viewModel = addEventViewModel
        //present modaly view controller using navigation controller
        self.navigationController.present(vc, animated: true)
    }
    
    
    func didFinishAddEvent()
    {
        print("DEBUG:☑️ AddEventCoordinator ☑️ didFinishAddEvent ☑️")
        parentCoordinator?.chilDidFinish(self)
    }
    
    
    deinit{
        print("DEBUG:☑️ AddEventCoordinator ❌ DEINIT ❌")
    }
}



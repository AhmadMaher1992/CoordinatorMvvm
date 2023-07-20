//
//  EventListViewModel.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 20/07/2023.
//

import Foundation


final class EventListViewModel
{
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    let title: String = "Events"
    var coordinator: EventListCoordinator?
    
    
    
    
    
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    func tappedAddEvent()
    {
        print("DEBUG:☑️ EventListViewModel ☑️ tappedAddEvent ☑️")
        coordinator?.startAddEvent()
    }
    
    
    
    deinit
    {
        print("DEBUG:☑️ EventListViewModel ❌ DEINIT ❌")
    }
    
    
    
}

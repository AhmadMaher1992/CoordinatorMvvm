//
//  AddEventViewModel.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 21/07/2023.
//

import UIKit

final class AddEventViewModel
{
    
    var coordinator: AddEventCoordinator?
    
    
    
    func viewDidDisappear()
    {
        print("DEBUG:☑️ AddEventViewModel ☑️ viewDidDisappear ☑️")
        coordinator?.didFinishAddEvent()
    }
    
    deinit{
        print("DEBUG:☑️ AddEventViewModel ❌ DEINIT ❌")
    }
    
}

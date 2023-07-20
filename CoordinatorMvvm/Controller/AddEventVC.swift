//
//  AddEventVC.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 21/07/2023.
//

import UIKit

class AddEventVC: UIViewController {

    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    var viewModel: AddEventViewModel!
    
    
    
    
    //------------------------------------------
    // MARK: - Life Cycle
    //------------------------------------------
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("DEBUG:☑️ AddEventVC ☑️ viewDidLoad ☑️")

        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
 

}

//
//  EventListVC.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 19/07/2023.
//

import UIKit

class EventListVC: UIViewController {
    
    var viewModel: EventListViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        didLoad_Setup()
       
    }
    
    private func didLoad_Setup()
    {
        let pluse_image = UIImage(systemName: "plus.circle.fill")
        let rightBarButtonItem = UIBarButtonItem(image: pluse_image, style: .plain, target: self, action: #selector(tappedAddEventButton))
        rightBarButtonItem.tintColor = .primaryColor
        self.title = viewModel.title
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc private func tappedAddEventButton()
    {
        print("DEBUG:☑️ EventListVC ☑️ tappedRightBarButton ☑️")
        viewModel.tappedAddEvent()
    }
    
   
    
    
    
    
}

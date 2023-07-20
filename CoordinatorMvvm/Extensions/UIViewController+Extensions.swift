//
//  UIViewController+Extensions.swift
//  CoordinatorMvvm
//
//  Created by Ahmed Maher on 21/07/2023.
//

import UIKit


extension UIViewController
{
    
    
    
    static func instantiate<T>()-> T
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(withIdentifier: "\(T.self)") as! T
        return controller
    }
    
}

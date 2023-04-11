//
//  HomeCoordinator.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showHome()
    }
    
    private func showHome() -> UIViewController {
        let vm = HomeViewModel()
        let vc = HomeViewController(viewModel: vm)
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
        navigationController = UINavigationController(rootViewController: vc)
        return navigationController
        
    }
    
    
    
}

//
//  MyWorkCoordinator.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class MyWorkCoordinator: Coordinator {
    
    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showMyWork()
    }
    
    private func showMyWork() -> UIViewController {
        
        let vm = MyWorkViewModel()
        let vc = MyWorkViewController(viewModel: vm)
        
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Subtract"), selectedImage: UIImage(named: "Subtract"))
        navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
}

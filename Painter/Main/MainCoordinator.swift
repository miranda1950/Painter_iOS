//
//  MainCoordinator.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var childCoordinators: [Coordinator] = [HomeCoordinator(), FleetCoordinator(), MyWorkCoordinator(), TestTabCoordinator()]
    
    func start() -> UIViewController {
        return createTabBar()
    }
    
    private func createTabBar() -> UITabBarController {
        let viewControllers = childCoordinators.map { coordinator -> UIViewController in
            let vc = coordinator.start()
            return vc
        }
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor.primary
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .black
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
    
}

//
//  FleetCoordinator.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class FleetCoordinator: Coordinator {
    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showFleet()
    }
    
    private func showFleet() -> UIViewController {
        
        let vm = FleetViewModel()
        let vc = FleetViewController(viewModel: vm)
        
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Page-1"), selectedImage: UIImage(named: "Page-1"))
        
        navigationController = UINavigationController(rootViewController: vc)
        
        return navigationController
    }
    
}

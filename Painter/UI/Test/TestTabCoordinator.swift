//
//  TestTabCoordinator.swift
//  Painter
//
//  Created by COBE on 04.05.2023..
//

import UIKit

final class TestTabCoordinator: Coordinator {
    
    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showTestTab()
    }
    
    private func showTestTab() -> UIViewController {
        let vm = TestViewModel()
        let vc = TestViewController(viewModel: vm)
        
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Subtract"), selectedImage: UIImage(named: "Subtract"))
        
        vm.popUpModel = { [weak self] in
            self?.showPopUp()
        }
        navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
    
    private func showPopUp() {
        let vc = PopUpModalViewController()
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: false)
    }
}

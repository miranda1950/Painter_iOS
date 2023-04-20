//
//  FleetViewController.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class FleetViewController: UIViewController {
    private var viewModel: FleetViewModel
    
    init(viewModel: FleetViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupNavBarAndScreen()
        
        self.view.sendSubviewToBack(gradientView)
    }
    
    private  lazy var navBarView: NavBarView = {
        let navView = NavBarView(title: "MyFleet", subtitle: "Team Managament")
        view.addSubview(navView)
        return navView
    }()
    
    private lazy var fleetCardView: FleetCardView = {
        let fleetCard = FleetCardView(fleet: "FLEET", fleetName: "Wagner Heroes", members: "")
        view.addSubview(fleetCard)
        return fleetCard
    }()
    
    private lazy var gradientView: UIView = {
        let gradView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 62))
        let gradient = CAGradientLayer()
        gradient.frame = gradView.bounds
        gradient.colors = [UIColor.gradient1.cgColor, UIColor.gradient2.cgColor]
        gradView.layer.insertSublayer(gradient, at: 0)
        view.addSubview(gradView)
        return(gradView)
    }()

}

extension FleetViewController {
    
    private func setupNavBarAndScreen() {
        view.backgroundColor = .white
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.tabBarController?.tabBar.setShadow(width: 0, height: 0, radius: 14, color: UIColor.black, opacity: 0.1)
    }
    
    private func setupConstraints() {
        
        navBarView.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0 ), size: CGSize(width: 0 ,height: 64))
        
        fleetCardView.anchor(top: (navBarView.bottomAnchor, 16), leading: (view.leadingAnchor,20), trailing: (view.trailingAnchor, 20))
        
        gradientView.anchor(top: (navBarView.bottomAnchor, 28), leading: (view.leadingAnchor,0), trailing: (view.trailingAnchor,0))
        
    }
}

//
//  MyWorkViewController.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class MyWorkViewController: UIViewController {
    
    private var dummyData = "It seems there is no paint work documented, yet. Once you create some jobs, they will appear in this list."
    
    private var viewModel: MyWorkViewModel
    
    
    init(viewModel: MyWorkViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
        setupNavBarAndScreen()
        self.view.sendSubviewToBack(gradientView)
        
    }
    
    private func setupNavBarAndScreen() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.tabBarController?.tabBar.setShadow(width: 0, height: 0, radius: 14, color: UIColor.black, opacity: 0.1)
        
        workCardView.setShadow(width: 0, height: 4, radius: 14, color: UIColor.grayShadow, opacity: 0.3)
    }
    
    private lazy var noContentView: NoContentView = {
        let viewContent = NoContentView(noJobTitle: "No Jobs", noJobDescription: dummyData, backImage: UIImage(named: "work")!)
        view.addSubview(viewContent)
        return viewContent
    }()
    
    private  lazy var navBarView: NavBarView = {
        let navView = NavBarView(title: "MyWork", subtitle: "Job Documentation")
        view.addSubview(navView)
        return navView
    }()
    
    private lazy var workCardView: MyWorkCardView = {
        let cardView =  MyWorkCardView(projects: "PROJECTS", jobs: "JOBS", search: "SEARCH", projectCount: 8, jobCount: 24, searchImageName: "search")
        cardView.backgroundColor = .blue
        cardView.backgroundColor = .white
        view.addSubview(cardView)
        return cardView
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


extension MyWorkViewController {
    
    private func setupConstraints() {
        
        navBarView.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0 ), size: CGSize(width: 0 ,height: 64))
        
        noContentView.anchor(top: (workCardView.bottomAnchor, 93), leading: (view.safeAreaLayoutGuide.leadingAnchor, 48), trailing: (view.safeAreaLayoutGuide.trailingAnchor, 48))
        
        workCardView.anchor(top: (navBarView.bottomAnchor, 16), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))
        workCardView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        gradientView.anchor(top: (navBarView.bottomAnchor,0))
        
    }
}

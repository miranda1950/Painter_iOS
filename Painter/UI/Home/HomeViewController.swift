//
//  HomeViewController.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel
    private var homeView = HomeView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.addEvents()
        setupConstraints()
        setupNavBarAndScreen()
        
        self.view.sendSubviewToBack(backgroundView)
        
        for event in viewModel.events {
            let cardViews = EventCardView(date: event.date, eventDescription: event.eventDescription, eventImage: event.eventImage)
            stackView.addArrangedSubview(cardViews)
        }
    }
    
    private  lazy var navBarView: NavBarView = {
        let navView = NavBarView(title: "Welcome back Miran!", subtitle: "Enjoy spraying!")
        view.addSubview(navView)
        return navView
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "Events"
        label.textColor = .black
        label.font = .boldMyriad.size(24)
        view.addSubview(label)
        return label
    }()
    
    private lazy var filterButton: UIButton = {
        let filterButton = UIButton()
        filterButton.setImage(UIImage(named: "filter"), for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        view.addSubview(filterButton)
        return filterButton
        
    }()
    
    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.text = "FILTER"
        label.textColor = .black
        label.font = .boldMyriad.size(14)
        view.addSubview(label)
        return label
    }()
    
    private lazy var stackView: UIStackView = {

        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 16
        view.addSubview(verticalStackView)
        return verticalStackView
        
    }()
    
    private lazy var backgroundView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .paleGray
        view.addSubview(backView)
        return(backView)
    }()
}

extension HomeViewController {
    
    private func setupConstraints() {
        
        navBarView.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0 ), size: CGSize(width: 0 ,height: 64))
        
        eventLabel.anchor(top: (navBarView.bottomAnchor, 22), leading: (view.leadingAnchor, 20), size: CGSize(width: 0, height: 28))
        
        filterButton.anchor(top: (navBarView.bottomAnchor, 24), trailing: (view.trailingAnchor, 20), size: CGSize(width: 24, height: 24))
        
        filterLabel.anchor(top: (navBarView.bottomAnchor,26), trailing: (filterButton.leadingAnchor,11), size: CGSize(width: 0, height: 20))
        
        stackView.anchor(top: (eventLabel.bottomAnchor,16),leading: (view.leadingAnchor,20), trailing: (view.trailingAnchor,20))
        
        backgroundView.anchor(top: (navBarView.bottomAnchor, 0), bottom: (view.safeAreaLayoutGuide.bottomAnchor,0),leading: (view.leadingAnchor,0), trailing: (view.trailingAnchor,0))
        
    }
    
    private func setupNavBarAndScreen() {
        view.backgroundColor = .white
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.tabBarController?.tabBar.setShadow(width: 0, height: 0, radius: 14, color: UIColor.black, opacity: 0.1)
    }
    
    @objc func filterButtonTapped() {
        print("filtering...")
    }
}



//
//  FleetViewController.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class FleetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dummyPumps = [Pumps]()
    private var offsetY: CGFloat = 0.0
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
        
        createDummyData()
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
        let fleetCard = FleetCardView(fleet: "FLEET", fleetName: "Wagner Heroes", members: 9)
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FleetCardCellView.self, forCellReuseIdentifier: "pumpCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        return tableView
    }()
    
    private lazy var addButtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.setShadow(width: 0, height: 4, radius: 14, color: .grayShadow, opacity: 0.3)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 30
        view.addSubview(button)
        return button
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
        
        tableView.anchor(top: (fleetCardView.bottomAnchor, 0),bottom: (view.safeAreaLayoutGuide.bottomAnchor,0), leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor, 0))
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        addButtton.anchor(bottom: (view.safeAreaLayoutGuide.bottomAnchor, 12), trailing: (view.safeAreaLayoutGuide.trailingAnchor, 12), size: CGSize(width: 60, height: 60))
    }
    
    func createDummyData() {
        
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ControlPro® 350", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "ProSpray 3.25 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ProSpray 3.31 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter3", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ProSpray 3.31 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyPumps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pumpCell", for: indexPath) as! FleetCardCellView
        let product = dummyPumps[indexPath.row]
        cell.selectionStyle = .none
        cell.pump = product
        
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        print("dragging begins")
        print("Position:  \(scrollView.contentOffset.x) , \(scrollView.contentOffset.y) ")
        
        if scrollView.contentOffset.y >= 0 {
            offsetY = scrollView.contentOffset.y
        }
        else {
            offsetY = 0
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = offsetY - scrollView.contentOffset.y
        
        if offset <= -1 {
            UIButton.animate(withDuration: AnimationsConstants.durationConstans, delay: 0, options: .curveEaseIn) {
                self.addButtton.alpha = 0.0
            }
            UIButton.animate(withDuration: AnimationsConstants.durationConstans, delay: 0) { [self] in
                self.addButtton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }
        }
        if offset > 0 {
            UIButton.animate(withDuration: AnimationsConstants.durationConstans, delay: 0, options: .curveEaseIn) {
                self.addButtton.alpha = 1.0
            }
            UIButton.animate(withDuration: AnimationsConstants.durationConstans, delay: 0) { [self] in
                self.addButtton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
    }
    
    @objc func addButtonTapped() {
        viewModel.showAddModal?()
    }
}

enum AnimationsConstants {
    static let durationConstans = 0.3
}


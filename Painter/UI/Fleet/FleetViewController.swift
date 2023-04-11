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
    private var fleetView = FleetView()
    
    init(viewModel: FleetViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarAndScreen()
        let testLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        testLabel.text = "Fleet View"
        testLabel.center = CGPoint(x: 160, y: 285)
        testLabel.textAlignment = .center
        testLabel.textColor = .primary
        testLabel.font = .regularMyriad.size(30)
        
        view.addSubview(testLabel)
    }
    
    
    private func setupNavBarAndScreen() {
        view.backgroundColor = .white
    }
}

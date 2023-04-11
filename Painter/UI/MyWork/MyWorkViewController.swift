//
//  MyWorkViewController.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class MyWorkViewController: UIViewController {
    
    private var viewModel: MyWorkViewModel
    private var myWorkView = MyWorkView()
    
    init(viewModel: MyWorkViewModel) {
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
        testLabel.text = "My Work View"
        testLabel.center = CGPoint(x: 160, y: 285)
        testLabel.textAlignment = .center
        testLabel.textColor = .primary
        testLabel.font = .lightMyriad.size(30)
        view.addSubview(testLabel)
    }
    
    private func setupNavBarAndScreen() {
        view.backgroundColor = .white
    }
}

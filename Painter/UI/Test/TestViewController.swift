//
//  TestViewController.swift
//  Painter
//
//  Created by COBE on 04.05.2023..
//

import UIKit

final class TestViewController: UIViewController {
    
    private var viewModel: TestViewModel
    
    init(viewModel: TestViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        addCallbacks()
        setupNavBarAndScreen()
        setupConstraints()
    }
    
    private lazy var navBarView: NavBarView = {
        let navView = NavBarView(title: "Test", subtitle: "Testing TextFields")
        view.addSubview(navView)
        return navView
    }()
    
    private lazy var textFieldView: TextFieldView = {
        let textView = TextFieldView(fieldName: "Label", isMandatory: true, iconRight: nil, iconLeft: nil)
        view.addSubview(textView)
        return textView
    }()
    
    private lazy var secondTextField: TextFieldView = {
        let textView = TextFieldView(fieldName: "Label", isMandatory: false,iconRight: nil, iconLeft: nil)
        view.addSubview(textView)
        return textView
    }()
    
    private lazy var thirdTextField: TextFieldView = {
        let textView = TextFieldView(fieldName: "Label", isMandatory: true, iconRight: UIImage(named: "icon-right"), iconLeft: UIImage(named: "search"))
        view.addSubview(textView)
        return textView
    }()
}

extension TestViewController {
    
    private func setupNavBarAndScreen() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.tabBarController?.tabBar.setShadow(width: 0, height: 0, radius: 14, color: UIColor.black, opacity: 0.1)
    }
    
    private func setupConstraints() {
        navBarView.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0 ), size: CGSize(width: 0 ,height: 64))
        
        textFieldView.anchor(top: (navBarView.bottomAnchor, 20), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20), size: CGSize(width: 0, height: 50))
        
        secondTextField.anchor(top: (textFieldView.bottomAnchor, 40), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20), size: CGSize(width: 0, height: 48))
        
        thirdTextField.anchor(top: (secondTextField.bottomAnchor, 40), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20), size: CGSize(width: 0, height: 48))
        
    }
    
    private func addCallbacks() {
        
        thirdTextField.popUpModel = { [weak self]  in
            self?.viewModel.popUpModel?()
        }
    }
}

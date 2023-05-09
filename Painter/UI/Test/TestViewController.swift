//
//  TestViewController.swift
//  Painter
//
//  Created by COBE on 04.05.2023..
//

import UIKit

final class TestViewController: UIViewController, UITextFieldDelegate {
    
    private var viewModel: TestViewModel
    
    var txtName: UITextField?
    
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
        
        setupNavBarAndScreen()
        setupConstraints()
    }
    
    private lazy var navBarView: NavBarView = {
        let navView = NavBarView(title: "Test", subtitle: "Testing TextFields")
        view.addSubview(navView)
        return navView
    }()

    private lazy var textFieldView: TextFieldView = {
        let textView = TextFieldView(fieldName: "Label", isMandatory: true)
        view.addSubview(textView)
        return textView
    }()
    
    private lazy var textField: UITextField = {
       let textField = UITextField()
       textField.contentVerticalAlignment = .center
       textField.delegate = self
       textField.textColor = .black
       textField.layer.borderColor = UIColor.grayBorder.cgColor
       textField.layer.borderWidth = 1
        textField.isUserInteractionEnabled = true
       textField.translatesAutoresizingMaskIntoConstraints = false
       textField.font = .regularMyriad.size(18)
       view.addSubview(textField)
       return textField
   }()
}

extension TestViewController {
    
    private func setupNavBarAndScreen() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.navigationController?.tabBarController?.tabBar.setShadow(width: 0, height: 0, radius: 14, color: UIColor.black, opacity: 0.1)

    }
    
    private func setupConstraints() {
        navBarView.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0 ), size: CGSize(width: 0 ,height: 64))

        textFieldView.anchor(top: (navBarView.bottomAnchor, 20), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))

        textField.anchor(top: (textFieldView.bottomAnchor, 80), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))
    }
}

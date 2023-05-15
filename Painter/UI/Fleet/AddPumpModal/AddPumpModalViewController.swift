//
//  AddPumpModalViewController.swift
//  Painter
//
//  Created by COBE on 12.05.2023..
//

import UIKit

final class AddPumpModalView: UIView {
    
    var onDismissed: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.addSubview(view)
        return view
    }()
    
    private lazy var addLabel: UILabel = {
        let label = UILabel()
        label.text = "ADD PUMP"
        label.textColor = .black
        label.font = .boldMyriad.size(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var pumpNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pump Name"
        label.textColor = .black
        label.font = .boldMyriad.size(16)
        self.addSubview(label)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.contentVerticalAlignment = .center
        textField.delegate = self
        textField.textColor = .black
        textField.layer.borderColor = UIColor.grayBorder.cgColor
        textField.layer.borderWidth = 1
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .regularMyriad.size(18)
        let leftPaddingView =  UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        leftPaddingView.backgroundColor = .white
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        self.addSubview(textField)
        return textField
    }()
    
    private lazy var discardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .paleGray
        let myAttributedTitle = NSAttributedString(string: "DISCARD",
                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,
                                                                NSAttributedString.Key.font : UIFont.boldMyriad.size(18)])
        button.setAttributedTitle(myAttributedTitle, for: .normal)
        button.addTarget(self, action: #selector(discardTapped), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        let myAttributedTitle = NSAttributedString(string: "CONFIRM",
                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,
                                                                NSAttributedString.Key.font : UIFont.boldMyriad.size(18)])
        button.setAttributedTitle(myAttributedTitle, for: .normal)
        self.addSubview(button)
        return button
    }()
}

extension AddPumpModalView {
    
    private func setConstraints() {
        
        self.backgroundColor = .black.withAlphaComponent(0.6)
        
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        
        addLabel.anchor(top: (container.topAnchor, 44), leading: (container.leadingAnchor, 24), size: CGSize(width: 0, height: 28))
        
        pumpNameLabel.anchor(top: (addLabel.bottomAnchor,32), leading: (container.leadingAnchor, 24), size: CGSize(width: 0, height: 20))
        
        nameTextField.anchor(top: (pumpNameLabel.bottomAnchor, 8), leading: (container.leadingAnchor, 24), trailing: (container.trailingAnchor, 24), size: CGSize(width: 0, height: 48))
        
        discardButton.anchor(bottom: (self
            .bottomAnchor, 32), leading: (container.leadingAnchor, 24), size: CGSize(width: 150, height: 60))
        
        confirmButton.anchor(bottom: (self.bottomAnchor, 32), trailing: (container.trailingAnchor,24), size: CGSize(width: 150, height: 60))
    }
    
    @objc func discardTapped() {
        UIView.animate(withDuration: AnimationsConstants.durationConstans, delay: 0, options: .curveEaseOut) {
            self.alpha = 0
        } completion: { complete in
            self.onDismissed?()
        }
    }
}

extension AddPumpModalView: UITextFieldDelegate {
    
}

//
//  TextField.swift
//  Painter
//
//  Created by COBE on 04.05.2023..
//

import UIKit

final class TextFieldView: UIView, UITextFieldDelegate {
    
    private var fieldName: String
    private var isMandatory: Bool
    
    
    init(fieldName: String, isMandatory: Bool) {
        self.fieldName = fieldName
        self.isMandatory = isMandatory
        
        super.init(frame: .zero)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldMyriad.size(16)
        label.text = fieldName
        label.numberOfLines = 1
        self.addSubview(label)
        return label
    }()
    
    private lazy var asterixLabel: UILabel = {
        let label = UILabel()
        label.text = isMandatory ? "*" : ""
        label.textColor = .asterixColor
        label.font = .boldMyriad.size(12)
        self.addSubview(label)
        return label
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
        self.addSubview(textField)
        return textField
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder text"
        label.textColor = .gray
        label.font = .lightMyriad.size(18)
        self.addSubview(label)
        return label
    }()
}

extension TextFieldView {
    
    private func setupConstraints() {
        
        nameLabel.anchor(top: (self.topAnchor, 0), leading: (self.leadingAnchor, 0))
        asterixLabel.anchor(top: (self.topAnchor,0), leading: (nameLabel.trailingAnchor, 0))
        
        textField.anchor(top: (nameLabel.bottomAnchor, 8), leading: (self.leadingAnchor, 0), trailing: (self.trailingAnchor, 0), size: CGSize(width: 0, height: 48))
        placeholderLabel.anchor(top: (textField.topAnchor, 12), leading: (textField.leadingAnchor, 12), size: CGSize(width: 0, height: 24))
        
    }
}



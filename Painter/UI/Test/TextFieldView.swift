//
//  TextField.swift
//  Painter
//
//  Created by COBE on 04.05.2023..
//

import UIKit

final class TextFieldView: UIView {
    
    private var fieldName: String
    private var isMandatory: Bool
    private var iconRight: UIImage?
    private var iconLeft: UIImage?
    
    var popUpModel: (()->Void)?
    
    init(fieldName: String, isMandatory: Bool, iconRight: UIImage?, iconLeft: UIImage?) {
        self.fieldName = fieldName
        self.isMandatory = isMandatory
        self.iconRight = iconRight
        self.iconLeft = iconLeft
        
        super.init(frame: .zero)
        
        if iconRight != nil {
            setConstraintsWithImage()
            
        } else {
            setupConstraints()
        }
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
        let leftPaddingView = iconLeft != nil ? UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 48)) : UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        leftPaddingView.backgroundColor = .white
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        let rightPaddingView = iconRight != nil ? UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 48)) : UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        rightPaddingView.backgroundColor = .white
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always
        self.addSubview(textField)
        return textField
    }()
    
    private lazy var searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = iconLeft
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder text"
        label.textColor = .gray
        label.font = .lightMyriad.size(18)
        self.addSubview(label)
        return label
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(iconRight, for: .normal)
        button.addTarget(self, action: #selector(iconTapped), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    
    private lazy var disableButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.addTarget(self, action: #selector(disableTapped), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
}

extension TextFieldView {
    
    private func setupConstraints() {
        
        
        nameLabel.anchor(top: (self.topAnchor, 0), leading: (self.leadingAnchor, 0))
        asterixLabel.anchor(top: (self.topAnchor,0), leading: (nameLabel.trailingAnchor, 0))
        
        textField.anchor(top: (nameLabel.bottomAnchor, 8), leading: (self.leadingAnchor, 0), trailing: (self.trailingAnchor, 0), size: CGSize(width: 0, height: 48))
        
        placeholderLabel.anchor(top: (textField.topAnchor, 12), leading: (textField.leadingAnchor, 12), size: CGSize(width: 0, height: 24))
        
        disableButton.anchor(bottom: (textField.topAnchor, 5), leading: (self.leadingAnchor,40))
        
    }
    
    private func setConstraintsWithImage() {
        
        nameLabel.anchor(top: (self.topAnchor, 0), leading: (self.leadingAnchor, 0))
        asterixLabel.anchor(top: (self.topAnchor,0), leading: (nameLabel.trailingAnchor, 0))
        
        textField.anchor(top: (nameLabel.bottomAnchor, 8), leading: (self.leadingAnchor, 0), trailing: (self.trailingAnchor, 0), size: CGSize(width: 0, height: 48))
        
        searchImage.anchor(top: (textField.topAnchor,12), leading: (textField.leadingAnchor, 12))
        
        placeholderLabel.anchor(top: (textField.topAnchor,12), leading: (searchImage.trailingAnchor, 12), size: CGSize(width: 0, height: 24))
        
        rightButton.anchor(top: (textField.topAnchor,12), trailing: (textField.trailingAnchor, 12))
        
    }
    
    @objc private func disableTapped() {
        textField.isUserInteractionEnabled = false
        textField.alpha = 0.5
    }
    
    @objc private func iconTapped() {
        popUpModel?()
    }
}

extension TextFieldView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Started")
        if textField.isValid(with: textField.text ?? "") {
            textField.layer.borderColor = UIColor.grayBorder.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            
        }
        placeholderLabel.isHidden = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text == "" {
            placeholderLabel.isHidden = false
        } else {
            placeholderLabel.isHidden = true
        }
        
        if textField.isValid(with: textField.text ?? "") {
            textField.layer.borderColor = UIColor.grayBorder.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.isValid(with: textField.text ?? "") {
            textField.layer.borderColor = UIColor.grayBorder.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
}


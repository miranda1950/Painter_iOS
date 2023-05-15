//
//  AddPumpModalViewController.swift
//  Painter
//
//  Created by COBE on 12.05.2023..
//

import UIKit

final class AddPumpModalView: UIView {
    
    var onDismissed: (() -> Void)?
    
    let defaultHeight: CGFloat = UIScreen.main.bounds.height * 0.45
    let dismissibleHeight: CGFloat = UIScreen.main.bounds.height * 0.25
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    var currentContainerHeight: CGFloat = UIScreen.main.bounds.height * 0.45
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateDismissView)))
        view.alpha = 0.6
        self.addSubview(view)
        return view
    }()
    
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
        
       
        backgroundView.anchor(top: (self.topAnchor,0), bottom: (self.bottomAnchor, 0), leading: (self.leadingAnchor,0), trailing: (self.trailingAnchor, 0))
        
        container.anchor(leading: (self.leadingAnchor, 0), trailing: (self.trailingAnchor,0))
        containerViewHeightConstraint = container.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        addLabel.anchor(top: (container.topAnchor, 44), leading: (container.leadingAnchor, 24), size: CGSize(width: 0, height: 28))

        pumpNameLabel.anchor(top: (addLabel.bottomAnchor,32), leading: (container.leadingAnchor, 24), size: CGSize(width: 0, height: 20))

        nameTextField.anchor(top: (pumpNameLabel.bottomAnchor, 8), leading: (container.leadingAnchor, 24), trailing: (container.trailingAnchor, 24), size: CGSize(width: 0, height: 48))

        discardButton.anchor(top: (nameTextField.bottomAnchor,32), leading: (container.leadingAnchor, 24), size: CGSize(width: 150, height: 60))

        confirmButton.anchor(top: (nameTextField.bottomAnchor,32), trailing: (container.trailingAnchor, 24), size: CGSize(width: 150, height: 60))
    }
    
    @objc func discardTapped() {
        UIView.animate(withDuration: AnimationsConstants.durationConstans, delay: 0, options: .curveEaseOut) {
            self.alpha = 0
        } completion: { complete in
            self.onDismissed?()
        }
    }
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanAction(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        self.addGestureRecognizer(panGesture)
    }
    
  
    @objc func handlePanAction(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)

        // Get drag direction
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? " down" : " up")")

        let newHeight = currentContainerHeight - translation.y

        switch gesture.state {
        case .changed:
            if newHeight < maximumContainerHeight {
                
                containerViewHeightConstraint?.constant = newHeight
                
                self.layoutIfNeeded()
            }
        case .ended:
            
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            
            else if newHeight < defaultHeight {
                
                animateContainerHeight(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                
                animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                
                animateContainerHeight(maximumContainerHeight)
            }
        default:
            break
        }
    }

    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            self.containerViewHeightConstraint?.constant = height
            self.layoutIfNeeded()
        }
        currentContainerHeight = height
    }
   
    
    func animatePresentContainer() {
       
        UIView.animate(withDuration: AnimationsConstants.durationConstans) {
            self.containerViewBottomConstraint?.constant = 0
            self.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.backgroundView.alpha = 0.6
        }
    }
    
  @objc func animateDismissView() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.layoutIfNeeded()
        }
        
        backgroundView.alpha = 0.6
        UIView.animate(withDuration: 0.4) {
            self.backgroundView.alpha = 0
        } completion: { _ in
            self.onDismissed?()
        }
    }
}

extension AddPumpModalView: UITextFieldDelegate {
    
}

//
//  HamburgerView.swift
//  Painter
//
//  Created by COBE on 27.04.2023..
//

import Foundation
import UIKit


final class HamburgerViewController: UIViewController {
    
    var onDismissed: (() -> Void)?
    
    let defaultWidth: CGFloat = UIScreen.main.bounds.width * 0.75
    let dismissibleWidth: CGFloat = UIScreen.main.bounds.width * 0.25
    let maximumContainerWidth: CGFloat = UIScreen.main.bounds.width * 0.75
    var currentContainerWidth: CGFloat = UIScreen.main.bounds.width * 0.75
    
    var containerViewWidthConstraint: NSLayoutConstraint?
    var containerViewTrailingConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    private lazy var backgroundView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .black
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateDismissView)))
        backView.alpha = 0.6
        view.addSubview(backView)
        return backView
    }()
    
    private lazy var container: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .primary
        containerView.clipsToBounds = true
        view.addSubview(containerView)
        return containerView
    }()
    
}

extension HamburgerViewController {
    
    func setConstraints() {
        
        backgroundView.anchor(top: (view.topAnchor,0), bottom: (view.bottomAnchor, 0), leading: (view.leadingAnchor,0), trailing: (view.trailingAnchor, 0))
        
        container.anchor(top: (view.topAnchor,0), bottom: (view.bottomAnchor,0))
        
        containerViewWidthConstraint = container.widthAnchor.constraint(equalToConstant: defaultWidth)
        containerViewTrailingConstraint = container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: defaultWidth)
        
        containerViewWidthConstraint?.isActive = true
        containerViewTrailingConstraint?.isActive = true
    }
    
    func setupPanGesture() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanAction(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanAction(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: container)

        let isDraggingRight = translation.x > 0
        print("Dragging direction: \(isDraggingRight ? "right" : "left")")

        let newWidth = currentContainerWidth - translation.x
        
        switch gesture.state {
        case .changed:
            if newWidth < maximumContainerWidth {
                
                containerViewWidthConstraint?.constant = newWidth
                
                view.layoutIfNeeded()
            }
            
        case .ended:
            
            if newWidth < dismissibleWidth {
                self.animateDismissView()
            }
            
            else if newWidth < defaultWidth {
                
                animateContainerWidth(defaultWidth)
            }

            else if newWidth > defaultWidth && !isDraggingRight {
                
                animateContainerWidth(maximumContainerWidth)
            }
        default:
            break
        }
    }
    
    func animateContainerWidth(_ width: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            self.containerViewWidthConstraint?.constant = width
            self.view.layoutIfNeeded()
        }
        currentContainerWidth = width
    }
    
    func animateShowDimmedView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.backgroundView.alpha = 0.6
        }
    }
    
    func animatePresentContainer() {
       
        UIView.animate(withDuration: AnimationsConstants.durationConstans) { [self] in
            containerViewTrailingConstraint?.constant = 0
            view.layoutIfNeeded()
        }
    }
    
    @objc func animateDismissView() {
        UIView.animate(withDuration: AnimationsConstants.durationConstans) { [self] in
            containerViewTrailingConstraint?.constant = defaultWidth
            view.layoutIfNeeded()
        }
        backgroundView.alpha = 0.6
        UIView.animate(withDuration: 0.4) {
            self.backgroundView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}

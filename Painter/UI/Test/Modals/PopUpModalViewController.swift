//
//  PopUpModalViewController.swift
//  Painter
//
//  Created by COBE on 10.05.2023..
//

import UIKit


final class PopUpModalViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        addCallbacks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateIn()
    }
    
    private lazy var popUpModel: PopUpModalView = {
        let model = PopUpModalView()
        view.addSubview(model)
        return model
    }()
}

extension PopUpModalViewController {
    
    private func setConstraints() {
        
        popUpModel.anchor(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
    }
    
    private func addCallbacks() {
        
        popUpModel.onDismissed = { [weak self] in
            self?.dismiss(animated: false)
        }
    }
    
    private func animateIn() {
        UIView.animate(withDuration: AnimationsConstants.durationConstans) {
            self.popUpModel.backgroundColor = .black.withAlphaComponent(0.6)
            self.popUpModel.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
}





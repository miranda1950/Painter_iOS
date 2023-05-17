//
//  AddPumpModalView.swift
//  Painter
//
//  Created by COBE on 12.05.2023..
//

import UIKit

final class AddPumpModalViewController: UIViewController {
    var onConfirmTapped: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        addCallbacks()
    }
    
    private lazy var addModal: AddPumpModalView = {
        let modal = AddPumpModalView()
        view.addSubview(modal)
        return modal
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        addModal.animateShowDimmedView()
        addModal.animatePresentContainer()
        addModal.setupPanGesture()
    }
}

extension AddPumpModalViewController {
    
    private func setConstraints() {
        addModal.anchor(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    private func addCallbacks() {
        addModal.onDismissed = { [weak self] in
            self?.dismiss(animated: false)
        }
        
        addModal.onConfirmTapped = { [weak self] text in
            self?.onConfirmTapped?(text)
            self?.dismiss(animated: false)
        }
    }
}

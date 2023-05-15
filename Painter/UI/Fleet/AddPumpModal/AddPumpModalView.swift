//
//  AddPumpModalView.swift
//  Painter
//
//  Created by COBE on 12.05.2023..
//

import UIKit

final class AddPumpModalViewController: UIViewController {
    
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
}

extension AddPumpModalViewController {
    
    private func setConstraints() {
        addModal.anchor(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    private func addCallbacks() {
        addModal.onDismissed = { [weak self] in
            self?.dismiss(animated: false)
        }
    }
}

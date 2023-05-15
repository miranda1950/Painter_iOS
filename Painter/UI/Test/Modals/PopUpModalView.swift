//
//  PopUpModalView.swift
//  Painter
//
//  Created by COBE on 10.05.2023..
//

import UIKit

final class PopUpModalView: UIView {
    
    var onDismissed: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Miran"
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = .regularMyriad.size(16)
        self.addSubview(label)
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(animateOut), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        self.addSubview(view)
        return view
    }()
}

extension PopUpModalView {
    private func setConstraints() {
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        titleLabel.anchor(top: (container.topAnchor,20), leading: (container.leadingAnchor,50))
        confirmButton.anchor(top: (titleLabel.bottomAnchor, 40), leading: (container.leadingAnchor, 40))
    }
    
    @objc private func animateOut() {
        UIView.animate(withDuration: AnimationsConstants.durationConstans, delay: 0, options: .curveEaseOut) {
            self.alpha = 0
        } completion: { complete in
            self.onDismissed?()
        }
    }
}

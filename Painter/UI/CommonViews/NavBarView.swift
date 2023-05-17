//
//  NavBarView.swift
//  Painter
//
//  Created by COBE on 17.04.2023..
//

import Foundation
import UIKit

final class NavBarView: UIView {
    
    private var title: String
    private var subtitle: String
    var showHamburgerModal: (()->Void)?
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        
        setupConstraints()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var logoImageView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo-small")
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoImage)
        return logoImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .boldMyriad.size(20)
        self.addSubview(label)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = subtitle
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = .regularMyriad.size(16)
        self.addSubview(label)
        return label
    }()
    
    private lazy var burgerButton: UIButton = {
        let burgerButton = UIButton()
        burgerButton.setImage(UIImage(named: "menu"), for: .normal)
        burgerButton.addTarget(self, action: #selector(burgerTapped), for: .touchUpInside)
        self.addSubview(burgerButton)
        return burgerButton
    }()
    
    
}

extension NavBarView {
    
    func setupConstraints() {
        
        logoImageView.anchor(top: (self.topAnchor, 12),bottom: (self.bottomAnchor, 12),leading: (self.leadingAnchor, 20), size: CGSize(width: 40, height: 40))
        
        titleLabel.anchor(top: (self.topAnchor, 10), leading: (logoImageView.trailingAnchor, 16))
        
        subTitleLabel.anchor(top: (self.topAnchor,34),leading: (logoImageView.trailingAnchor, 16))
        
        burgerButton.anchor(top: (self.topAnchor, 20), trailing: (self.trailingAnchor, 20))
        
    }
    
    @objc func burgerTapped() {
        showHamburgerModal?()
    }
    
    
}

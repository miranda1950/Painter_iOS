//
//  HamburgerView.swift
//  Painter
//
//  Created by COBE on 27.04.2023..
//

import Foundation
import UIKit


final class HamburgerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var accountImageView: UIImageView = {
        let accountImage = UIImageView()
        accountImage.image = UIImage(systemName: "person.fill")
        accountImage.contentMode = .scaleAspectFill
        accountImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(accountImage)
        return accountImage
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "ACCOUNT"
        label.textColor = .black
        label.font = .boldMyriad.size(18)
        self.addSubview(label)
        return label
    }()
    
    private lazy var FAQImageView: UIImageView = {
        let FAQImage = UIImageView()
        FAQImage.image = UIImage(systemName: "questionmark.square.fill")
        FAQImage.contentMode = .scaleAspectFill
        FAQImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(FAQImage)
        return FAQImage
    }()
    
    
    private lazy var FAQLabel: UILabel = {
        let label = UILabel()
        label.text = "Options"
        label.textColor = .black
        label.font = .boldMyriad.size(18)
        self.addSubview(label)
        return label
    }()
    
}

extension HamburgerView {
    func setupConstraints() {
        accountImageView.anchor(top: (self.topAnchor, 40), leading: (self.leadingAnchor, 20))
        accountLabel.anchor(top: (self.topAnchor, 60), leading: (accountImageView.trailingAnchor, 20))
        FAQLabel.anchor(top: (accountLabel.bottomAnchor, 20), leading: (self.leadingAnchor, 10))
    }
}

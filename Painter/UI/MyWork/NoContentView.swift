//
//  NoContentView.swift
//  Painter
//
//  Created by COBE on 17.04.2023..
//

import Foundation
import UIKit

final class NoContentView: UIView {
    
    private var noJobTitle: String
    private var noJobDescription: String
    private var backImage: UIImage
    
    init(noJobTitle: String, noJobDescription: String, backImage: UIImage) {
        self.noJobTitle = noJobTitle
        self.noJobDescription = noJobDescription
        self.backImage = backImage
        super.init(frame: .zero)
        
        setupConstraints()
        
    }
    
    //convenience??
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = backImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var noJobsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.text = noJobTitle
        label.font = .boldMyriad.size(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var noJobDescriptionLabel: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = .black
        label.text = noJobDescription
        label.font = .lightMyriad.size(18)
        label.setLineSpacing(lineSpacing: 6, alignment: .center)
        self.addSubview(label)
        return label
    }()
}

extension NoContentView {
    
    func setupConstraints() {
        
        backgroundImageView.anchor(leading: (self.leadingAnchor, 6), trailing: (self.trailingAnchor, 6))
        
        noJobsLabel.anchor(top: (backgroundImageView.bottomAnchor, 40))
        noJobsLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        
        noJobDescriptionLabel.anchor(top: (noJobsLabel.bottomAnchor, 16), size: CGSize(width: 264, height: 72))
        noJobDescriptionLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
    }
}

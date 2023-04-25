//
//  FleetCardCellView.swift
//  Painter
//
//  Created by COBE on 20.04.2023..
//

import Foundation
import UIKit


class FleetCardCellView: UITableViewCell {
    
    var pump: Pumps? {
        didSet {
            pumpImageView.image = pump?.image
            nameLabel.text = pump?.name
            impactLabel.text = pump?.impact
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var spacingView: UIView = {
        let spacingView = UIView()
        spacingView.backgroundColor = .white
        spacingView.layer.cornerRadius = 4
        spacingView.setShadow(width: 0, height: 4, radius: 14, color: UIColor.grayShadow, opacity: 0.3)
        self.addSubview(spacingView)
        return spacingView
    }()
    
    private lazy var pumpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"pump")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .regularMyriad.size(18)
        label.textAlignment = .left
        self.addSubview(label)
        return label
    }()
    
    private lazy var impactLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldMyriad.size(18)
        label.textAlignment = .left
        self.addSubview(label)
        return label
    }()
}

extension FleetCardCellView {
    
    func setupConstraints() {
        
        self.backgroundColor = .white
        
        spacingView.anchor(top: (self.topAnchor,8), bottom: (self.bottomAnchor, 8), leading: (self.leadingAnchor, 20), trailing: (self.trailingAnchor, 20))
        
        pumpImageView.anchor(top: (spacingView.topAnchor, 0), bottom: (spacingView.bottomAnchor, 0), leading: (spacingView.leadingAnchor, 0), size: CGSize(width: 84, height: 0))
        
        nameLabel.anchor(top: (spacingView.topAnchor, 16), leading: (pumpImageView.trailingAnchor, 34),trailing: (spacingView.trailingAnchor,34), size: CGSize(width: 0, height: 24))
        
        impactLabel.anchor(top: (nameLabel.bottomAnchor, 4), leading: (pumpImageView.trailingAnchor, 16), trailing: (spacingView.trailingAnchor,16), size: CGSize(width: 0, height: 24))
        
        
//        pumpImageView.anchor(top: (self.topAnchor,0),bottom: (self.bottomAnchor,0), leading: (self.leadingAnchor,0), size: CGSize(width: 84, height: 84))
//
//        nameLabel.anchor(top: (self.topAnchor, 16),leading: (self.leadingAnchor, 118), trailing: (self.trailingAnchor,34), size: CGSize(width: 0, height: 24))
//
//        impactLabel.anchor(top: (nameLabel.bottomAnchor, 4),leading: (self.leadingAnchor, 100), trailing: (self.trailingAnchor, 16), size: CGSize(width: 0, height: 24))
    }
}

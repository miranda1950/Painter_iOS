//
//  FleetCardView.swift
//  Painter
//
//  Created by COBE on 20.04.2023..
//

import Foundation
import UIKit

final class FleetCardView: UIView {
    
    private var fleet: String
    private var fleetName: String
    private var members: String
    
    init(fleet: String, fleetName: String, members: String) {
        self.fleet = fleet
        self.fleetName = fleetName
        self.members = members
        super.init(frame: .zero)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var fleetLabel: UILabel = {
       let label = UILabel()
        label.text = fleet
        label.textColor = .black
        label.font = .boldMyriad.size(12)
        label.textAlignment = .left
        self.addSubview(label)
        return label
    }()
    
    private lazy var fleetNameLabel: UILabel = {
        let label = UILabel()
        label.text = fleetName
        label.textColor = .black
        label.font = .boldMyriad.size(20)
        label.textAlignment = .left
        self.addSubview(label)
        return label
    }()
    
    private lazy var membersLabel: UILabel = {
        let label = UILabel()
        label.text = members
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .black
        self.addSubview(label)
        return label
    }()
}

extension FleetCardView {
    
    private func setupConstraints() {
        self.backgroundColor = .white
        self.setShadow(width: 0, height: 4, radius: 14, color: UIColor.grayShadow, opacity: 0.3)
        
        fleetLabel.anchor(top: (self.topAnchor, 16), leading: (self.leadingAnchor, 16),trailing: (self.trailingAnchor,16), size: CGSize(width: 0, height: 16))
        
        fleetNameLabel.anchor(top: (fleetLabel.bottomAnchor,4), leading: (self.leadingAnchor, 16),trailing: (self.trailingAnchor, 16),size: CGSize(width: 0, height: 24))
        
        membersLabel.anchor(top: (fleetNameLabel.bottomAnchor, 8),bottom: (self.bottomAnchor, 16), leading: (self.leadingAnchor, 16), trailing: (self.trailingAnchor,90), size: CGSize(width: 0, height: 20))
    }
}

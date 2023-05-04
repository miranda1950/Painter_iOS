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
    private var members: Int
    
    init(fleet: String, fleetName: String, members: Int) {
        self.fleet = fleet
        self.fleetName = fleetName
        self.members = members
        
        super.init(frame: .zero)
        
        setupConstraints()
        fleetMembersCircle(members)
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
    
    private lazy var membersStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        self.addSubview(stackView)
        return stackView
    }()
}

extension FleetCardView {
    
    private func setupConstraints() {
        self.backgroundColor = .white
        self.setShadow(width: 0, height: 4, radius: 14, color: UIColor.grayShadow, opacity: 0.3)
        self.layer.cornerRadius = 4
        
        fleetLabel.anchor(top: (self.topAnchor, 16), leading: (self.leadingAnchor, 16),trailing: (self.trailingAnchor,16), size: CGSize(width: 0, height: 16))
        
        fleetNameLabel.anchor(top: (fleetLabel.bottomAnchor,4), leading: (self.leadingAnchor, 16),trailing: (self.trailingAnchor, 16),size: CGSize(width: 0, height: 24))
        
        membersStack.anchor(top: (fleetNameLabel.bottomAnchor, 8), bottom: (self.bottomAnchor, 16), leading: (self.leadingAnchor, 16))
    }
    
    func fleetMembersCircle(_ members: Int) {
        
        if members <= 7 {
            for _ in 0...members - 1 {
                membersStack.addArrangedSubview(UIImageView(image: UIImage(systemName: "bolt.circle.fill")))
            }
        }
        else {
            for _ in 0...6 {
                membersStack.addArrangedSubview(UIImageView(image: UIImage(systemName: "bolt.circle.fill")))
            }
            membersStack.addArrangedSubview(getRemainingNumberLabel(members - 7))
        }
    }
    
    func getRemainingNumberLabel(_ remainingCount: Int) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.text = "+\(remainingCount)"
        return label
    }
}

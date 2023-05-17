//
//  EventCardView.swift
//  Painter
//
//  Created by COBE on 19.04.2023..
//

import Foundation
import UIKit

final class EventCardView: UIView {
    
    private var date: Date
    private var eventDescription: String
    private var eventImage: UIImage?
    
    init(date: Date, eventDescription: String, eventImage: UIImage?) {
        self.date = date
        self.eventDescription = eventDescription
        self.eventImage = eventImage
        super.init(frame: .zero)
        
        setAppearance()
        
        if eventImage != nil {
            constraintsWithImage()
        }
        else {
            constraintsWithoutImage()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = eventImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        label.text = formatter.string(from: date)
        label.font = .boldMyriad.size(12)
        label.textColor = eventImage != nil ? .grayLabel : .black
        label.numberOfLines = 1
        self.addSubview(label)
        return label
    }()
    
    private lazy var eventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = eventDescription
        label.font = .regularMyriad.size(18)
        label.textAlignment = .left
        label.numberOfLines = 2
        self.addSubview(label)
        return label
    }()
}

extension EventCardView {
    
    func setAppearance() {
        
        self.setShadow(width: 0, height: 4, radius: 14, color: UIColor.grayShadow, opacity: 0.3)
        self.layer.cornerRadius = 4
        self.backgroundColor = eventImage != nil ? .white : .primary
    }
    
    func constraintsWithImage() {
        
        self.anchor(size: CGSize(width: 0, height: 84))
        eventImageView.anchor(top: (self.topAnchor,0),bottom: (self.bottomAnchor,0),leading: (self.leadingAnchor,0),size: CGSize(width: 84, height: 84))
        dateLabel.anchor(top: (self.topAnchor, 9), leading: (eventImageView.trailingAnchor, 16), size: CGSize(width: 0, height: 16))
        eventDescriptionLabel.anchor(top: (dateLabel.bottomAnchor,2), leading: (eventImageView.trailingAnchor,16),trailing: (self.trailingAnchor, 16), size: CGSize(width: 0, height: 48))
    }
    
    func constraintsWithoutImage() {

        self.anchor(size: CGSize(width: 0, height: 64))
        
        dateLabel.anchor(top: (self.topAnchor, 12), leading: (self.leadingAnchor, 16), size: CGSize(width: 0, height: 16))
        
        eventDescriptionLabel.anchor(top: (dateLabel.bottomAnchor,0), leading: (self.leadingAnchor,16),trailing: (self.trailingAnchor, 16), size: CGSize(width: 0, height: 24))
    }
}

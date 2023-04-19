//
//  MyWorkView.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class MyWorkView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
       
    }
    
//    private lazy var backgroundImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "work")
//        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(imageView)
//        return imageView
//    }()
//
//    private lazy var headTitle: UILabel = {
//       let label = UILabel()
//        label.text = "No Jobs"
//        label.textColor = .black
//        label.font = .boldMyriad.size(24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(label)
//        return label
//    }()
//
//    private lazy var subTitle: UILabel = {
//        let label = UILabel()
//        label.text = "It seems there is no paint work documented, yet. Once you create some jobs, they will appear in this list."
//        label.textColor = .black
//        label.font = .lightMyriad.size(18)
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(label)
//        return label
//    }()
//
//    private lazy var projectsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "PROJECTS"
//        label.textColor = .gray
//        label.font = .boldMyriad.size(12)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var projectNumberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "8"
//        label.textColor = .black
//        label.font = .boldMyriad.size(24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var projectStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [projectsLabel, projectNumberLabel])
//        stackView.frame = CGRect(x: 0, y: 0, width: 85, height: 44)
//        stackView.backgroundColor = .yellow
//        stackView.alignment  = .center
//        stackView.axis = .vertical
//        stackView.spacing = 4
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var jobsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "JOBS"
//        label.textColor = .gray
//        label.font = .boldMyriad.size(12)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var jobsNumberLabel: UILabel = {
//        let label = UILabel()
//        label.text = "24"
//        label.textColor = .black
//        label.font = .boldMyriad.size(24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var jobsStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [jobsLabel, jobsNumberLabel])
//        stackView.frame = CGRect(x: 0, y: 0, width: 85, height: 44)
//        stackView.backgroundColor = .green
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.spacing = 4
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var horizontalStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [projectStackView, jobsStackView])
//        stackView.axis = .horizontal
//        stackView.spacing = 101
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var workView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.addSubview(horizontalStackView)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
   
}

private extension MyWorkView {
    func setup() {
//        addSubview(workView)
//        
//        workView.anchor(top: (safeAreaLayoutGuide.topAnchor, 16), leading: (safeAreaLayoutGuide.leadingAnchor, 20), trailing: (safeAreaLayoutGuide.trailingAnchor, 20), size: CGSize(width: 320, height: 64))
//        workView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
////        jobsStackView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
//        projectStackView.anchor(leading: (safeAreaLayoutGuide.leadingAnchor,36))
////        jobsStackView.anchor(leading: (safeAreaLayoutGuide.leadingAnchor,137), trailing: (safeAreaLayoutGuide.trailingAnchor, 137))
//        horizontalStackView.anchor(top: (safeAreaLayoutGuide.topAnchor,26))
//    
//        
//        
//        backgroundImage.anchor(top: (safeAreaLayoutGuide.topAnchor, 261), leading: (safeAreaLayoutGuide.leadingAnchor, 54),trailing: (safeAreaLayoutGuide.trailingAnchor, 54))
//       
//        
//        headTitle.anchor(top: (backgroundImage.bottomAnchor, 40))
//        headTitle.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
//        
//        subTitle.anchor(top: (headTitle.bottomAnchor, 16), size: CGSize(width: 264, height: 72))
//        subTitle.centerXAnchor.constraint(equalTo: headTitle.centerXAnchor).isActive = true
//        
        
    }
}



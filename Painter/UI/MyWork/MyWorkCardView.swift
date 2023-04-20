//
//  MyWorkCardView.swift
//  Painter
//
//  Created by COBE on 18.04.2023..
//

import Foundation
import UIKit

final class MyWorkCardView: UIView {
    
    
    private var projects: String
    private var jobs: String
    private var search: String
    private var projectCount: Int
    private var jobCount: Int
    private var searchImageName: String
    
    //320 width?
    init(projects: String, jobs: String, search: String, projectCount: Int, jobCount: Int, searchImageName: String) {
        self.projects = projects
        self.jobs = jobs
        self.search = search
        self.projectCount = projectCount
        self.jobCount = jobCount
        self.searchImageName = searchImageName
        super.init(frame: .zero)
        setupConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private lazy var projectLabel: UILabel = {
        let label = UILabel()
        label.text = projects
        label.numberOfLines = 1
        label.textAlignment = .center
//        label.backgroundColor = .gray
        label.textColor = .gray
        label.font = .boldMyriad.size(12)
        self.addSubview(label)
        return label
    }()
    
    private lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = jobs
        label.numberOfLines = 1
        label.textAlignment = .center
//        label.backgroundColor = .green
        label.textColor = .gray
        label.font = .boldMyriad.size(12)
        self.addSubview(label)
        return label
    }()
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = search
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .boldMyriad.size(12)
        self.addSubview(label)
        return label
    }()
    
    private lazy var projectNumberLabel: UILabel = {
        let label = UILabel()
        label.text = String(projectCount)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldMyriad.size(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var jobNumberLabel: UILabel = {
        let label = UILabel()
        label.text = String(jobCount)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldMyriad.size(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var searchImageView: UIImageView = {
        let searchImage = UIImageView()
        searchImage.image = UIImage(named: searchImageName)
        searchImage.contentMode = .scaleAspectFill
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchImage)
        return searchImage
    }()
    
}

extension MyWorkCardView {
    
    func setupConstraints() {
        
        self.layer.cornerRadius = 4
        
        projectLabel.anchor(top: (self.topAnchor,10), leading: (self.leadingAnchor, 16), size: CGSize(width: (UIScreen.main.bounds.width / 3) - 64, height: 16) )
        jobLabel.anchor(top: (self.topAnchor,10),leading: (projectLabel.trailingAnchor, 16), size: CGSize(width: (UIScreen.main.bounds.width / 3) - 64, height: 16))
        //breaking constraints??
        jobLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        searchLabel.anchor(top: (self.topAnchor, 10), leading: (jobLabel.trailingAnchor, 16), size: CGSize(width: (UIScreen.main.bounds.width / 3) - 64, height: 16))
        
        projectNumberLabel.anchor(top: (self.topAnchor,26))
        projectNumberLabel.centerXAnchor.constraint(equalTo: projectLabel.centerXAnchor).isActive = true

        jobNumberLabel.anchor(top: (self.topAnchor,26))
        jobNumberLabel.centerXAnchor.constraint(equalTo: jobLabel.centerXAnchor).isActive = true

        searchImageView.anchor(top: (self.topAnchor, 26))
        searchImageView.centerXAnchor.constraint(equalTo: searchLabel.centerXAnchor).isActive = true
        
    }
}

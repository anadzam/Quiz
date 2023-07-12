//
//  SubjectCell.swift
//  Quiz
//
//  Created by Ana Dzamelashvili on 7/11/23.
//

import Foundation
import UIKit

class SubjectCell: UITableViewCell {
    
    private let greyView: UIView = {
        let greyView = UIView()
        greyView.backgroundColor = Constants.Colors.neutralLighterGrey
        greyView.translatesAutoresizingMaskIntoConstraints = false
        greyView.layer.cornerRadius = 26
        return greyView
    }()
    
    private let subjectIcon: UIImageView = {
        let subjectIcon = UIImageView()
        subjectIcon.contentMode = .scaleToFill
        subjectIcon.translatesAutoresizingMaskIntoConstraints = false
        
        return subjectIcon
    }()
    
    private let subjectLabel: UILabel = {
        
        let subjectLabel = UILabel()
        subjectLabel.text = "გეოგრაფია"
        subjectLabel.textAlignment = .left
        subjectLabel.textColor = Constants.Colors.neutralDarkGrey
        subjectLabel.font = .systemFont(ofSize: 16, weight: .bold)
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        return subjectLabel
    }()
    
    private let subjectDetailLabel: UILabel = {
        let subjectDetailLabel = UILabel()
        subjectDetailLabel.textColor = Constants.Colors.neutralGrey
        subjectDetailLabel.font = .systemFont(ofSize: 12)
        subjectDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return subjectDetailLabel
    }()
    
    private let detailButton: UIButton = {
        let detailButton = UIButton()
        detailButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.detailButton), for: .normal)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        
        return detailButton
//        detailButton.target(forAction: <#T##Selector#>, withSender: <#T##Any?#>)
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpSubviews() {
        contentView.addSubview(greyView)
        greyView.addSubview(subjectIcon)
        greyView.addSubview(subjectDetailLabel)
        greyView.addSubview(subjectLabel)
        greyView.addSubview(detailButton)
    }
    
    private func setUpConstraints() {
        setUpGreyViewConstraints()
        setUpSubjectIconConstraints()
        setUpSubjectLabelConstraints()
        setUpSubjectDetailLabelConstraints()
        setUpButtonConstraints()
    }
    
    
    private func setUpGreyViewConstraints() {
        NSLayoutConstraint.activate([
            greyView.topAnchor.constraint(equalTo: contentView.topAnchor),
            greyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            greyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
        
    }
    
    private func setUpSubjectIconConstraints() {
        NSLayoutConstraint.activate([
            subjectIcon.leadingAnchor.constraint(equalTo: greyView.leadingAnchor, constant: 29.5),
            subjectIcon.centerYAnchor.constraint(equalTo: greyView.centerYAnchor),
            subjectIcon.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -264.49),
            
        ])
        
    }
    
    private func setUpSubjectLabelConstraints() {
        NSLayoutConstraint.activate([
            subjectLabel.leadingAnchor.constraint(equalTo: subjectIcon.trailingAnchor, constant: 18),
            subjectLabel.topAnchor.constraint(equalTo: greyView.topAnchor, constant: 33),
            subjectLabel.bottomAnchor.constraint(equalTo: greyView.bottomAnchor, constant: -52),
            subjectLabel.widthAnchor.constraint(equalToConstant: 145)
            
        ])
        
    }
    
    private func setUpSubjectDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            subjectDetailLabel.leadingAnchor.constraint(equalTo: subjectIcon.trailingAnchor, constant: 18),
            subjectDetailLabel.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: 2),
//            subjectDetailLabel.bottomAnchor.constraint(equalTo: greyView.bottomAnchor, constant: 34),
            
        ])
        
    }
    private func setUpButtonConstraints() {
        NSLayoutConstraint.activate([
            detailButton.centerYAnchor.constraint(equalTo: greyView.centerYAnchor),
            detailButton.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -29.5),
            detailButton.leadingAnchor.constraint(equalTo: subjectLabel.trailingAnchor, constant: 27),
            
        ])
        
    }
    
    
    func configure(with subject: Subject) {
//        subjectIcon.image = subject.icon
        subjectLabel.text = subject.subjectTitle
        subjectDetailLabel.text = "აღწერა"
    }
}

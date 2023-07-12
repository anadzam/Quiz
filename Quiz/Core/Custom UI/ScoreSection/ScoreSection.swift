//
//  GpaView.swift
//  Quiz
//
//  Created by Ana Dzamelashvili on 7/11/23.
//

import Foundation
import UIKit

class ScoreSection: UIView {
    
    //MARK: - Components
    
    private let viewBackground: UIView = {
        let viewBackground = UIView()
        viewBackground.backgroundColor = Constants.Colors.bluePrimary
        viewBackground.layer.cornerRadius = 26
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        return viewBackground
    }()
    
    private let gpaScoreView: UIView = {
        let gpaScoreView = UIView()
        gpaScoreView.backgroundColor = Constants.Colors.blueSecondaryLighter
        gpaScoreView.layer.cornerRadius = 14
        gpaScoreView.translatesAutoresizingMaskIntoConstraints = false
        return gpaScoreView
    }()
    
    private let gpaScoreLabel: UILabel = {
        let gpaScoreLabel = UILabel()
        gpaScoreLabel.text = "GPA - 4.0"
        gpaScoreLabel.textColor = .white
        gpaScoreLabel.font = .systemFont(ofSize: 16)
        gpaScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return gpaScoreLabel
    }()
    private let detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.text = "დეტალურად"
        detailLabel.textColor = .white
        
        detailLabel.font = .systemFont(ofSize: 12)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailLabel
    }()
    
    private let arrowSign: UIImageView = {
        let arrowSign = UIImageView()
        arrowSign.image = UIImage(assetIdentifier: Constants.AssetIdentifier.arrowSign)
        arrowSign.translatesAutoresizingMaskIntoConstraints = false
        arrowSign.contentMode = .scaleAspectFit
        return arrowSign
    }()
    
   
    
    //MARK: - init
    
    init() {
        super.init(frame: .zero)
        setUpSubviews()
        setUpGPAviewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal error")
    }
    
    
    //MARK: - Add subviews
    private func setUpSubviews() {
        self.addSubview(viewBackground)
        viewBackground.addSubview(gpaScoreView)
        viewBackground.addSubview(arrowSign)
        viewBackground.addSubview(detailLabel)
        gpaScoreView.addSubview(gpaScoreLabel)
        
    }
    
    //MARK: - Set up constraits
    private func setUpGPAviewConstraints() {
        setUpGpaViewConstraints()
        setUpGpaScoreViewConstraints()
        setUpLabelConstraint()
        steUpArrowSignConstraints()
        setUpDetailLabelConstraints()
        steUpArrowSignConstraints()
    }
    
    private func setUpGpaViewConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func steUpArrowSignConstraints() {
        NSLayoutConstraint.activate([
            arrowSign.heightAnchor.constraint(equalToConstant: 10),
            arrowSign.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            arrowSign.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -34)
            
        ])
        
    }
    
    private func setUpDetailLabelConstraints() {
        NSLayoutConstraint.activate([
            detailLabel.widthAnchor.constraint(equalToConstant: 80),
            detailLabel.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: arrowSign.trailingAnchor, constant: -8)
            
        ])
        
    }
    
    private func setUpGpaScoreViewConstraints() {
        NSLayoutConstraint.activate([
            gpaScoreView.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            gpaScoreView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 18),
            gpaScoreView.widthAnchor.constraint(equalToConstant: 82),
            gpaScoreView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
    private func setUpLabelConstraint() {
        NSLayoutConstraint.activate([
            gpaScoreLabel.centerYAnchor.constraint(equalTo: gpaScoreView.centerYAnchor),
            gpaScoreLabel.centerXAnchor.constraint(equalTo: gpaScoreView.centerXAnchor)
        ])
    }
    
}

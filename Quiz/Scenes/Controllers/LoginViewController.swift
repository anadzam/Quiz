//
//  ViewController.swift
//  Quiz
//
//  Created by Ani Dzamelashvili on 20.06.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let label: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.labelNames.loginLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fonts.loginLabelFont, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let illustration: UIImageView = {
        let illustration = UIImageView()
        illustration.image = UIImage(assetIdentifier: .illustration)
        illustration.translatesAutoresizingMaskIntoConstraints = false
        return illustration
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: Constants.fonts.loginLabelFont, size: 12)
        textView.autocorrectionType = .no
        textView.textColor = Constants.Colors.placeholder
        textView.layer.borderColor = Constants.Colors.textViewBorderColor
//        textView.textContainerInset = UIEdgeInsets(top: Constants.TextView.topEdge,
//                                                   left: Constants.TextView.leftEdge,
//                                                   bottom:  Constants.TextView.topEdge,
//                                                   right: Constants.TextView.leftEdge)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let placeholder: UILabel = {
        let placeholder = UILabel()
        placeholder.text = Constants.labelNames.placeholder
        placeholder.font = Constants.fonts.loginTextView
//        placeholder.sizeToFit()
        placeholder.textColor = Constants.Colors.placeholder
        
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        return placeholder
    }()
   
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = Constants.Colors.yellowColor
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubviews()
        setUpConstraints()
        
    }
    private func setUpSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(illustration)
        scrollView.addSubview(label)
        scrollView.addSubview(textView)
        scrollView.addSubview(loginButton)
    }
    private func setUpConstraints() {
        scrollViewConstraints()
        illustrationConstraints()
        labelConstraints()
        textViewConstraints()
        loginButtonConstraints()
    }
    
    //MARK: - Constraints
    private func scrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func illustrationConstraints() {
        NSLayoutConstraint.activate([
            illustration.topAnchor.constraint(equalTo: scrollView.topAnchor),
            illustration.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            illustration.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
    private func labelConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 121),
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
    }
    
    private func textViewConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 525),
            textView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: 26)
        ])
    }
    
    private func loginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 149),
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 117),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 117)
            
        ])
    }

}


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
        scrollView.isScrollEnabled = false
        return scrollView
    }()
    
    private let label: UILabel  = {
        let label = UILabel()
        label.textColor = .white
        label.text = Text.welcomeLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fonts.loginLabelFont, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let illustration: UIImageView = {
        let illustration = UIImageView()
        illustration.image = UIImage(assetIdentifier: .illustration)
        illustration.contentMode = .scaleToFill
        illustration.translatesAutoresizingMaskIntoConstraints = false
        return illustration
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: Constants.fonts.loginLabelFont, size: 12)
        textView.autocorrectionType = .no
        //        textView.backgroundColor = Constants.Colors.yellowColor
        textView.textColor = Constants.Colors.placeholder
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = Constants.Colors.yellowPrimary.cgColor
        textView.layer.cornerRadius = 12
        textView.textAlignment = .center
        textView.textContainerInset = UIEdgeInsets(top: Constants.TextView.topEdge,
                                                   left: Constants.TextView.leftEdge,
                                                   bottom:  Constants.TextView.topEdge,
                                                   right: Constants.TextView.leftEdge)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let placeholder: UILabel = {
        let placeholder = UILabel()
        placeholder.text = Text.placeholder
        placeholder.font = .systemFont(ofSize: 12)
        //        placeholder.sizeToFit()
        placeholder.textColor = Constants.Colors.placeholder
        
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        return placeholder
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 12
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        loginButton.setTitle(Text.loginButtonLabel, for: .normal)
        loginButton.backgroundColor = Constants.Colors.yellowPrimary
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textView.delegate = self
        keyboardDisplayNotifications()
        setUpSubviews()
        setUpConstraints()
        hideKeyboard()
        
    }
    @objc func loginButtonTapped() {
        print("login button tapped")
        textView.resignFirstResponder()
        let rootVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
        
    }
    
    //MARK: - Responding to keyboard notifications
    private func keyboardDisplayNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    private func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
//        view.endEditing(true)
        let loginButtonFrame = loginButton.convert(loginButton.bounds, to: view)
            let location = sender.location(in: view)

            if !loginButtonFrame.contains(location) {
                view.endEditing(true)
            }
    }
    
    private func setUpSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(illustration)
        scrollView.addSubview(label)
        scrollView.addSubview(textView)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(placeholder)
    }
    
    private func setUpConstraints() {
        scrollViewConstraints()
        illustrationConstraints()
        labelConstraints()
        textViewConstraints()
        loginButtonConstraints()
        placeholderConstraints()
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
            illustration.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            illustration.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            illustration.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
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
            textView.topAnchor.constraint(equalTo: illustration.bottomAnchor, constant: 92),
            textView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textView.heightAnchor.constraint(equalToConstant: 44),
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 53),
            textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 54)
            
        ])
    }
    private func placeholderConstraints() {
        NSLayoutConstraint.activate([
            placeholder.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            placeholder.centerYAnchor.constraint(equalTo: textView.centerYAnchor)
            
        ])
    }
    
    private func loginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 26),
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 141),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 149)
            
        ])
    }
    
}

//MARK: - UITextViewDelegate
extension LoginViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholder.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholder.isHidden = false
        }
    }
    
}



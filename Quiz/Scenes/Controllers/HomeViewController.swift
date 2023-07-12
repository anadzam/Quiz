//
//  HomeView.swift
//  Quiz
//
//  Created by Ani Dzamelashvili on 05.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    let tableView = UITableView()
    private let viewModel = HomeViewModel()
    
    let subjectArray = ["Math", "Geography", "History", "Literature", "English"]
    
    private let userLabel: UILabel = {
        let userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.textColor = Constants.Colors.yellowPrimary
        userLabel.text = "გამარჯობა, ირაკლი"
        userLabel.font = .boldSystemFont(ofSize: 16)
        return userLabel
        
    }()
    
    private lazy var gpaView: ScoreSection = {
        let gpaView = ScoreSection()
        gpaView.translatesAutoresizingMaskIntoConstraints = false
        gpaView.isUserInteractionEnabled = true
        
        return gpaView
    }()
    
    private let subjectLabel: UILabel = {
        let subjectLabel = UILabel()
        subjectLabel.text = "აირჩიე საგანი"
        subjectLabel.textColor = Constants.Colors.neutralDarkGrey
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectLabel.font = .systemFont(ofSize: 16)
        return subjectLabel
    }()
    
    private let logOutButton: UIButton = {
        let logOutButton = UIButton()
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.logoutButton), for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        return logOutButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        configureTableView()
        
        setUpConstraint()
        
    }
    
    @objc func logOutButtonTapped() {
        dismiss(animated: true)
    }
    
    private func configureTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(SubjectCell.self, forCellReuseIdentifier: "SubjectCell")
        //        tableView.register(subjectCell.self, forCellReuseIdentifier: "SubjectCell")
        //        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addSubViews() {
        view.addSubview(userLabel)
        view.addSubview(tableView)
        view.addSubview(logOutButton)
        view.addSubview(gpaView)
        view.addSubview(subjectLabel)
        
    }
    
    private func setUpConstraint() {
        labelConstraints()
        logoutButtonConstraints()
        tableViewConstraints()
        gpaViewConstraints()
        subjectLabelConstraints()
    }
    private func labelConstraints() {
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            userLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
            
        ])
    }
    
    private func gpaViewConstraints() {
        NSLayoutConstraint.activate([
            
            gpaView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20),
            gpaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            gpaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            gpaView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    private func subjectLabelConstraints() {
        NSLayoutConstraint.activate([
            subjectLabel.topAnchor.constraint(equalTo: gpaView.bottomAnchor, constant: 32),
            subjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
    
    
    private func logoutButtonConstraints() {
        NSLayoutConstraint.activate([
            
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
        ])
    }
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -16)
            
        ])
    }
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subjectCell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        subjectCell.configure(with: viewModel.subjects[indexPath.row])
        
       
        return subjectCell
    }
    
    
    
}

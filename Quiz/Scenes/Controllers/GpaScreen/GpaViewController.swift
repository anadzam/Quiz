//
//  GpaViewController.swift
//  Quiz
//
//  Created by Ana Dzamelashvili on 7/13/23.
//

import UIKit

class GpaViewController: UIViewController {
    let tableView = UITableView()
    //for testing addign homeview model
    private let viewModel = HomeViewModel()
    
    private let logoutButton: UIButton = {
        let logoutButton = UIButton()
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setImage(UIImage(assetIdentifier: Constants.AssetIdentifier.logoutButton), for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return logoutButton
    }()
    
    private lazy var noScoreLabel: UILabel = {
        let noScoreLabel = UILabel()
        noScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        noScoreLabel.numberOfLines = 3
        noScoreLabel.textAlignment = .center
        noScoreLabel.text = "🧐 სამწუხაროდ, ქულები ჯერ არ გაქვს დაგროვილი."
        return noScoreLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.addSubview(noScoreLabel)
        view.addSubview(tableView)
        view.addSubview(logoutButton)
        setUpTableView()
        setUpTableViewConstraints()
        setUpLogoutButtonConstraints()
        setUpNavigationBar()
//        setUpNoScoreLabelConstraints()
        
    }
    @objc func logoutButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //for testing adding subjectcell
        tableView.register(SubjectCell.self, forCellReuseIdentifier: "GpaCell")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = "დაგროვილი ქულები ⭐️"
        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.backb

//        navigationItem.leftBarButtonItem?.title = ""
        navigationController?.navigationBar.topItem?.title = ""
        //        let navFont = [NSAttributedStringKey.font: .systemFont(ofSize: 16)]
//
//        UINavigationBar.appearance().titleTextAttributes = navFont
       
    }

    
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 93),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -200)
        ])
        
    }
    
    private func setUpLogoutButtonConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    private func setUpNoScoreLabelConstraints() {
        NSLayoutConstraint.activate([
            noScoreLabel.widthAnchor.constraint(equalToConstant: 195),
            noScoreLabel.heightAnchor.constraint(equalToConstant: 84),
            noScoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

extension GpaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gpaCell = tableView.dequeueReusableCell(withIdentifier: "GpaCell", for: indexPath) as! SubjectCell
        gpaCell.configure(with: viewModel.subjects[indexPath.row])
        return gpaCell
    }
    
}

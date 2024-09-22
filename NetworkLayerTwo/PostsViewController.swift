//
//  PostsViewController.swift
//  NetworkLayerTwo
//
//  Created by Назар on 21.09.2024.
//

import UIKit

final class PostsViewController: UIViewController {

    // MARK: - Private property
    
    private let tableView = UITableView()
    
    private let network = Network()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinding()
    }
}

    // MARK: - Setups

private extension PostsViewController {
    func setupView() {
        addViews()
        
        setupTableView()
        
        layout()
    }
    func setupBinding() {
        network.getPosts(stringURL: "https://jsonplaceholder.typicode.com/posts")
    }
}

    // MARK: - Setup components

private extension PostsViewController {
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

    // MARK: - Layout

private extension PostsViewController {
    func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

    // MARK: - UITableViewDataSource

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "1"
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PostsViewController: UITableViewDelegate {

}

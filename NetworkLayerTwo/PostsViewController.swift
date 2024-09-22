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
    
    private let network: NetworkProtocol
    
    private var posts = [Post]()
    
    // MARK: - Init
    
    init(network: NetworkProtocol) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        network.getPosts(stringURL: URLs.posts) { [weak self] posts in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
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
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let title = posts[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PostsViewController: UITableViewDelegate {

}

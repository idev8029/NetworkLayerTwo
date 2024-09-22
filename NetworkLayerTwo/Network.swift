//
//  Network.swift
//  NetworkLayerTwo
//
//  Created by Назар on 21.09.2024.
//

import Foundation

final class Network {
    func getPosts (stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        
        let shared = URLSession.shared
        
        shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                print(posts)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

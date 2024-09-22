//
//  Builder.swift
//  NetworkLayerTwo
//
//  Created by Назар on 22.09.2024.
//

import Foundation

final class Builder {
    static func makePostsViewController() -> PostsViewController {
        let network = Network()
        let vc = PostsViewController(network: network)
        
        return vc
    }
}

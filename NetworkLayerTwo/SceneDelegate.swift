//
//  SceneDelegate.swift
//  NetworkLayerTwo
//
//  Created by Назар on 21.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let vc = Builder.makePostsViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
    }
}


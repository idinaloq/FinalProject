//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/10.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootViewController: HomeViewController = HomeViewController()
//        let rootViewController: MapViewController = MapViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }



}


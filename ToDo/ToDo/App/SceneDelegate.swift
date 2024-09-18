//
//  SceneDelegate.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // UIWindow 인스턴스 생성
        let window = UIWindow(windowScene: windowScene)
        
        let rootViewController = ToDoItemsListViewController()
        window.rootViewController = rootViewController
        
        // window 설정 및 표시
        self.window = window
        window.makeKeyAndVisible()
    }
}


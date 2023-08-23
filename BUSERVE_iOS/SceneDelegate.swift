//
//  SceneDelegate.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.backgroundColor = .Background
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController()) // TabBarViewController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        SocialLoginManager.shared.checkLoginState()
//        let result = SocialLoginManager.shared.checkLoginState()
//        DispatchQueue.main.async {
//            self.showAppropriateViewController(isLoggedIn: result)
//        }
//        Task {
//            let isLoggedIn = await SocialLoginManager.shared.checkLoginState()
//
//            // Main thread에서 UI 업데이트 수행
//            DispatchQueue.main.async {
//                self.showAppropriateViewController(isLoggedIn: isLoggedIn)
//            }
//        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func showAppropriateViewController(isLoggedIn: Bool) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else {
            return
        }

        if isLoggedIn {
            // 로그인이 되어 있을 때 TabBarViewController 표시
            let tabBarVC = TabBarViewController()
            delegate.window?.rootViewController = tabBarVC
        } else {
            // 로그인이 되어 있지 않을 때 다른 뷰 컨트롤러 표시 (예: 로그인 페이지)
            let loginVC = LoginViewController()
            delegate.window?.rootViewController = loginVC
        }

        delegate.window?.makeKeyAndVisible()
    }
}


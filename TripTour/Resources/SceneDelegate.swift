//
//  SceneDelegate.swift
//  TripTour
//
//  Created by 권정근 on 6/17/24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupWindow(with: scene)
        self.checkAuthentication()
        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        let mainTabBarVC = MainTabBarViewController()
//        if AuthManager.shared.isSignedIn == true {
//            window?.rootViewController = mainTabBarVC
//            window?.rootViewController = UINavigationController(rootViewController: RegisterViewController())
//        } else {
//            let welcomeVC = UINavigationController(rootViewController: WelcomeViewController())
//            welcomeVC.navigationBar.prefersLargeTitles = true
//            welcomeVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
//            window?.rootViewController = welcomeVC
//        }
//        
//        window?.rootViewController = MainTabBarViewController()
//        window?.makeKeyAndVisible()
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            
            // Go to sign in screen
            let welcomeVC = UINavigationController(rootViewController: WelcomeViewController())
            welcomeVC.navigationBar.prefersLargeTitles = true
            welcomeVC.modalPresentationStyle = .overFullScreen
            welcomeVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
            
            window?.rootViewController = welcomeVC
        } else {
            // Go to home screen
            let mainTabBarVC = MainTabBarViewController()
            window?.rootViewController = mainTabBarVC
        }
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
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


//
//  AppDelegate.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let firstVc = UIStoryboard(name: "ImageViewer", bundle: .main).instantiateViewController(identifier: "ImageViewerVC")
        AppDelegate().shared().window?.rootViewController = firstVc
        AppDelegate().shared().window?.makeKeyAndVisible()
        return true
    }
    func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }


}


//
//  AppDelegate.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit
//import Nuke
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var uiVC = ImageViewerUIVCTableView() as? ImageViewerUIVC
        var vM = TableImageViewerVM() as? ImageViewerVM
        let firstVc = UIStoryboard(name: "ImageViewer", bundle: .main).instantiateViewController(identifier: "ImageViewerVC") as! ImageViewerVC
        firstVc.imageViewerVM = vM
        firstVc.imageViewerUIVC = uiVC
        AppDelegate().shared().window?.rootViewController = firstVc
        AppDelegate().shared().window?.makeKeyAndVisible()
        vM?.view = firstVc as? ImageViewerVC
        uiVC?.view = firstVc as? ImageViewerVC
        return true
    }
    func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }


}


//
//  AppRouter.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import Foundation
import UIKit

class AppRouter {

    class func landOnHome() {
        if let todoVC = UIStoryboard.instantiateVC(storyboard: .tdList, identifier: TDListVC.className) {
            let navigationController = UINavigationController(rootViewController: todoVC)
            navigationController.navigationBar.isHidden = true
//            appDelegate?.window?.rootViewController = navigationController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            if let window = appDelegate.window {
                window.rootViewController = navigationController
            } else {
                print("window not forund in appdelegate")
            }

        }
    }

}

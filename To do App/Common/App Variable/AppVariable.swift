//
//  AppVariable.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import UIKit

let SCREEN_WIDTH =  UIScreen.main.bounds.size.width
let SCREEN_HEIGHT =  UIScreen.main.bounds.size.height
var appDelegate = UIApplication.shared.delegate as? AppDelegate

class AppVariable: NSObject {

    static let shared: AppVariable = AppVariable()

//    var STATUSBAR_HEIGHT: CGFloat {
//        return appDelegate?.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//    }

}

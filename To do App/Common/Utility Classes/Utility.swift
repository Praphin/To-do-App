//
//  Utility.swift
//  To do App
//
//  Created by Praphin SP on 15/01/22.
//

import Foundation
import UIKit

class Utility {

}

extension NSObject {
    static var className : String {
        return String(describing:self)
    }
    
    var classNameFromObject : String {
        return String(describing:self)
    }
}

extension UIStoryboard {
    
    static func instantiateVC(storyboard: StoryboardName, identifier: String) -> UIViewController? {
        return UIStoryboard(name: storyboard.rawValue , bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
}

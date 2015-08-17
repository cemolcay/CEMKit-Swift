//
//  CEMKit+UIViewController.swift
//  
//
//  Created by Cem Olcay on 12/08/15.
//
//

import UIKit

extension UIViewController {
    
    var top: CGFloat {
        
        if let me = self as? UINavigationController {
            return me.visibleViewController.top
        }
        
        if let nav = self.navigationController {
            if nav.navigationBarHidden {
                return view.top
            } else {
                return nav.navigationBar.bottom
            }
        } else {
            return view.top
        }
    }
    
    var bottom: CGFloat {
        
        if let me = self as? UINavigationController {
            return me.visibleViewController.bottom
        }
        
        if let tab = tabBarController {
            if tab.tabBar.hidden {
                return view.bottom
            } else {
                return tab.tabBar.top
            }
        } else {
            return view.bottom
        }
    }
    
    
    var tabBarHeight: CGFloat {
            
        if let me = self as? UINavigationController {
            return me.visibleViewController.tabBarHeight
        }
        
        if let tab = self.tabBarController {
            return tab.tabBar.frame.size.height
        }
        
        return 0
    }
    
    
    var navigationBarHeight: CGFloat {

        if let me = self as? UINavigationController {
            return me.visibleViewController.navigationBarHeight
        }
        
        if let nav = self.navigationController {
            return nav.navigationBar.h
        }
        
        return 0
    }
    
    var navigationBarColor: UIColor? {
        
        get {
            
            if let me = self as? UINavigationController {
                return me.visibleViewController.navigationBarColor
            }
            
            return navigationController?.navigationBar.tintColor
            
        } set {
            navigationController?.navigationBar.barTintColor = newValue
        }
    }
    
    var navBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    
    var applicationFrame: CGRect {
        return CGRect (x: view.x, y: top, width: view.w, height: bottom - top)
    }
    
    
    func push (vc: UIViewController) {
        if self is UINavigationController {
            (self as! UINavigationController).pushViewController (vc, animated: true)
        } else {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func pop () {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func present (vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func dismiss (completion: (()->Void)?) {
        dismissViewControllerAnimated(true, completion: completion)
    }
}


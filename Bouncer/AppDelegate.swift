//
//  AppDelegate.swift
//  Bouncer
//
//  Created by ying on 16/3/4.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //global
    struct Motion {
        static let Manager = CMMotionManager()
    }

}


//
//  ViewController.swift
//  Bouncer
//
//  Created by ying on 16/3/4.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bouncer = BouncerBehavior()
    lazy var animator: UIDynamicAnimator = { UIDynamicAnimator(referenceView: self.view) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bouncer)
    }
    
    var redBlock: UIView?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if redBlock == nil {
            redBlock = addBlock()
            redBlock?.backgroundColor = UIColor.redColor()
            bouncer.addBlock(redBlock!)
        }
        
    }
    
    struct Constants {
        static let BlockSize = CGSize(width: 40, height: 40)
    }
    
    func addBlock() -> UIView
    {
        let block = UIView(frame: CGRect(origin: CGPoint.zero, size: Constants.BlockSize))
        block.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(block)
        return block
    }

}


//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by ying on 16/3/4.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    //Add gravity
    let gravity = UIGravityBehavior()
    //As same reason.
    lazy var collider: UICollisionBehavior = {
        let lazilyCratedCollider = UICollisionBehavior()
        lazilyCratedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCratedCollider
    }()
    
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazilyCreateblockBehavior = UIDynamicItemBehavior()
        lazilyCreateblockBehavior.allowsRotation = true
        lazilyCreateblockBehavior.elasticity = 0.85 //1 - completely not loss energy
        lazilyCreateblockBehavior.friction = 0
        lazilyCreateblockBehavior.resistance = 0
        return lazilyCreateblockBehavior
    }()
    
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, name: String)
    {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView)
    {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView)
    {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }


}

//
//  TraitOverrideViewController.swift
//  AdaptiveWeaponry
//
//  Created by Bogdan on 20/02/15.
//  Copyright (c) 2015 ShinobiControls. All rights reserved.
//

import UIKit

class TraitOverrideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performTraitCollectionOverrideForSize(view.bounds.size)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        performTraitCollectionOverrideForSize(size)
    }
    
    private func performTraitCollectionOverrideForSize(size: CGSize) {
        var overrideTraitCollection: UITraitCollection? = nil
        if (size.width > 500) {
            overrideTraitCollection = UITraitCollection(horizontalSizeClass: .Regular)
        }
        
        for vc in childViewControllers as [UIViewController] {
            setOverrideTraitCollection(overrideTraitCollection, forChildViewController: vc)
        }
    }
}

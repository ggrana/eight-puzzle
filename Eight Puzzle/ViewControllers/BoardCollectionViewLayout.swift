//
//  BoardCollectionViewLayout.swift
//  Eight Puzzle
//
//  Created by Gustavo Graña on 3/27/15.
//  Copyright (c) 2015 Mestrado. All rights reserved.
//

import UIKit

class BoardCollectionViewLayout: UICollectionViewFlowLayout {
   
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        var attributes = self.layoutAttributesForItemAtIndexPath(itemIndexPath)
        attributes.alpha = 0
        var size = self.collectionView?.frame.size
        var center = CGPointMake(size!.width/2, size!.height/2)
        attributes.center = center
        return attributes
    }
    
//    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//    attributes.alpha = 0.0;
//    
//    CGSize size = [self collectionView].frame.size;
//    attributes.center = CGPointMake(size.width / 2.0, size.height / 2.0);
//    return attributes;
    
}

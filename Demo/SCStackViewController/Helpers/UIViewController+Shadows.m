//
//  UIViewController+Shadows.m
//  SCStackViewController
//
//  Created by Stefan Ceriu on 16/08/2013.
//  Copyright (c) 2013 Stefan Ceriu. All rights reserved.
//

#import "UIViewController+Shadows.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat shadowSize = 10;

@implementation UIView (Shadows)

- (void)castShadowWithPosition:(SCShadowEdge)position;
{
    CGRect shadowRect = self.bounds;
    
    if(position & SCShadowEdgeTop) {
        shadowRect.origin.y -= shadowSize;
        shadowRect.size.height += shadowSize;
    }
    
    if(position & SCShadowEdgeLeft) {
        shadowRect.origin.x -= shadowSize;
        shadowRect.size.width += shadowSize;
    }
    
    if(position & SCShadowEdgeBottom) {
        shadowRect.size.height += shadowSize;
    }
    
    if(position & SCShadowEdgeRight) {
        shadowRect.size.width += shadowSize;
    }
    
    self.layer.masksToBounds = NO;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowOpacity = 0.25;
    
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowRect].CGPath;
}

@end

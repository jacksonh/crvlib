//
//  UIView+CRVAutoLayout.h
//  codereview
//
//  Created by Jackson Harper on 1/10/14.
//  Copyright (c) 2014 Harper Semiconductors, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRVAutoLayout)

- (void)crv_fillSuperview;
- (void)crv_fillSuperviewHorizontally;

- (NSLayoutConstraint *)crv_addConstraintForWidth:(CGFloat)width;
- (NSLayoutConstraint *)crv_addConstraintForHeight:(CGFloat)height;
- (NSArray *)crv_addConstraintsForWidth:(CGFloat)width andHeight:(CGFloat)height;

- (void)crv_alignBaselines:(NSArray *)items;
- (void)crv_alignLeftEdges:(NSArray *)items;
- (void)crv_addAutoLayoutSubview:(UIView *)view;

- (NSLayoutConstraint *)crv_pinTopToSuperviewTop;
- (NSLayoutConstraint *)crv_pinBottomToSuperviewBottom;

@end

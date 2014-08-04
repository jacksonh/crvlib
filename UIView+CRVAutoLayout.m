//
//  UIView+CRVAutoLayout.m
//  codereview
//
//  Created by Jackson Harper on 1/10/14.
//  Copyright (c) 2014 Harper Semiconductors, Inc. All rights reserved.
//

#import "UIView+CRVAutoLayout.h"

@implementation UIView (CRVAutoLayout)

- (void)crv_fillSuperview
{
	NSDictionary *views = @{ @"self": self };
	[[self superview] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[self]|" options:0 metrics:nil views:views]];
	[[self superview] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:nil views:views]];
}

- (void)crv_fillSuperviewHorizontally
{
	NSDictionary *views = @{ @"self": self };
	[[self superview] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[self]|" options:0 metrics:nil views:views]];
}

- (void)crv_addAutoLayoutSubview:(UIView *)view
{
	[self addSubview:view];
	[view setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (NSArray *)crv_addConstraintsForWidth:(CGFloat)width andHeight:(CGFloat)height
{
	return @[ [self crv_addConstraintForWidth:width], [self crv_addConstraintForHeight:height]];
}

- (NSLayoutConstraint *)crv_addConstraintForHeight:(CGFloat)height
{
	NSLayoutConstraint * res = [NSLayoutConstraint constraintWithItem:self
															attribute:NSLayoutAttributeHeight
															relatedBy:NSLayoutRelationEqual
															   toItem:nil
															attribute:NSLayoutAttributeNotAnAttribute
														   multiplier:1.0
															 constant:height];
	[self addConstraint:res];
	return res;
}

- (NSLayoutConstraint *)crv_addConstraintForWidth:(CGFloat)width
{
	NSLayoutConstraint * res = [NSLayoutConstraint constraintWithItem:self
															attribute:NSLayoutAttributeWidth
															relatedBy:NSLayoutRelationEqual
															   toItem:nil
															attribute:NSLayoutAttributeNotAnAttribute
														   multiplier:1.0
															 constant:width];
	[self addConstraint:res];
	return res;
}

- (void)crv_alignBaselines:(NSArray *)items
{
	[self crv_alignAttribute:NSLayoutAttributeBaseline ofItems:items];
}

- (void)crv_alignLeftEdges:(NSArray *)items
{
	[self crv_alignAttribute:NSLayoutAttributeLeft ofItems:items];
}

- (void)crv_alignAttribute:(NSLayoutAttribute)att ofItems:(NSArray *)items
{
	if ([items count] < 2)
		return;
	
	UIView *first = [items firstObject];
	for (int i = 1; i < [items count]; i++) {
		[self addConstraint:[NSLayoutConstraint constraintWithItem:[items objectAtIndex:i]
														 attribute:att
														 relatedBy:NSLayoutRelationEqual
															toItem:first
														 attribute:att
														multiplier:1.0
														  constant:0.0]];
	}
}

- (NSLayoutConstraint *)crv_pinTopToSuperviewTop
{
	NSLayoutConstraint *res = [NSLayoutConstraint constraintWithItem:self
														   attribute:NSLayoutAttributeTop
														   relatedBy:NSLayoutRelationEqual
															  toItem:[self superview]
														   attribute:NSLayoutAttributeTop
														  multiplier:1.0
															constant:0.0];
	[[self superview] addConstraint:res];
	return res;
}

- (NSLayoutConstraint *)crv_pinBottomToSuperviewBottom
{
	NSLayoutConstraint *res = [NSLayoutConstraint constraintWithItem:self
														   attribute:NSLayoutAttributeBottom
														   relatedBy:NSLayoutRelationEqual
															  toItem:[self superview]
														   attribute:NSLayoutAttributeBottom
														  multiplier:1.0
															constant:0.0];
	[[self superview] addConstraint:res];
	return res;

}

@end


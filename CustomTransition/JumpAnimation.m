//
//  JumpAnimation.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "JumpAnimation.h"
#import "QQFirstViewController.h"
#import "QQSecondViewController.h"

@implementation JumpAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UINavigationController *con = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    QQFirstViewController *fromViewController = (QQFirstViewController *)con.topViewController;
    QQSecondViewController *toViewController = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *imageSnapShot = [fromViewController.imageView snapshotViewAfterScreenUpdates:YES];
    imageSnapShot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.containerView];
    
    fromViewController.imageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:imageSnapShot];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1;
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        imageSnapShot.frame = frame;
    } completion:^(BOOL finished){
        toViewController.imageView.hidden = NO;
        fromViewController.imageView.hidden = NO;
        [imageSnapShot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end

//
//  DownAnimation.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "DownAnimation.h"
#import "QQFirstViewController.h"
#import "QQSecondViewController.h"

@implementation DownAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
        
    UINavigationController *controller = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    QQFirstViewController *toViewController = (QQFirstViewController *)controller.topViewController;
    QQSecondViewController *fromViewController = (QQSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *container = [transitionContext containerView];
    
    UIView *imageSnapShot = [fromViewController.imageView snapshotViewAfterScreenUpdates:YES];
    imageSnapShot.frame = [container convertRect:fromViewController.imageView.frame fromView:fromViewController.view];
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    fromViewController.imageView.hidden = YES;
    
    [container addSubview:imageSnapShot];
    [container addSubview:controller.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1;
        CGRect frame = [container convertRect:toViewController.imageView.frame fromView:toViewController.containerView];
        imageSnapShot.frame = frame;
    } completion:^(BOOL finished){
        toViewController.imageView.hidden = NO;
        fromViewController.imageView.hidden = NO;
        [imageSnapShot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end

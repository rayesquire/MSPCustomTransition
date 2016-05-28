//
//  SwipeDownInteractiveTransition.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "SwipeDownInteractiveTransition.h"

@interface SwipeDownInteractiveTransition ()

@property (nonatomic, readwrite, assign) BOOL shouldComplete;

@property (nonatomic, readwrite, strong) UIViewController *presentingViewController;

@end

@implementation SwipeDownInteractiveTransition

- (void)connectToViewController:(UIViewController *)viewController view:(UIView *)view {
    self.presentingViewController = viewController;
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view.superview];
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat progress = translation.y / recognizer.view.frame.size.height;
            progress = fmin(fmax(progress, 0.0), 1.0);
            self.shouldComplete = (progress > 0.3);
            [self updateInteractiveTransition:progress];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            self.interacting = NO;
            if (!self.shouldComplete || recognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }
            else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end

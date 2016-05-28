//
//  SwipeDownInteractiveTransition.h
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeDownInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, readwrite, assign) BOOL interacting;

- (void)connectToViewController:(UIViewController *)viewController view:(UIView *)view;

@end

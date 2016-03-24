//
//  SwipeRightInteractiveTransition.h
//  baby
//
//  Created by 马了个马里奥 on 16/3/21.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeRightInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, readwrite, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController *)viewController;

@end

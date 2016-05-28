//
//  ViewController.h
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/3/24.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RightViewController;
@protocol RightViewControllerDelegate <NSObject>

- (void)rightViewControllerDidClickedDismissButton:(RightViewController *)viewController;

@end

@interface RightViewController : UIViewController

@property (nonatomic, readwrite, weak) id<RightViewControllerDelegate> delegate;

@end


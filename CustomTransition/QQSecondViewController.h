//
//  QQSecondViewController.h
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QQSecondViewController;
@protocol QQSecondViewControllerDelegate <NSObject>

@optional
- (void)secondViewControllerDidClickedDismissButton:(QQSecondViewController *)viewController;

@end

@interface QQSecondViewController : UIViewController 

@property (nonatomic, readwrite, strong) UIImageView *imageView;

@property (nonatomic, readwrite, weak) id<QQSecondViewControllerDelegate> delegate;

@end

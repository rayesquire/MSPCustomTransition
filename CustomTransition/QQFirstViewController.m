//
//  QQFirstViewController.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "QQFirstViewController.h"
#import "QQSecondViewController.h"
#import "JumpAnimation.h"
#import "DownAnimation.h"
#import "SwipeDownInteractiveTransition.h"

@interface QQFirstViewController ()<UIViewControllerTransitioningDelegate,QQSecondViewControllerDelegate>

@property (nonatomic, readwrite, strong) JumpAnimation *jumpAnimation;

@property (nonatomic, readwrite, strong) DownAnimation *downAnimation;

@property (nonatomic, readwrite, strong) SwipeDownInteractiveTransition *interactiveTransition;

@end

@implementation QQFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationController.navigationBarHidden = YES;

    self.jumpAnimation = [JumpAnimation new];
    self.downAnimation = [DownAnimation new];
    self.interactiveTransition = [SwipeDownInteractiveTransition new];
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    self.containerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.containerView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, 48, 48)];
    self.imageView.layer.cornerRadius = 24;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.image = [UIImage imageNamed:@"bkg.jpeg"];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jump)]];
    [self.containerView addSubview:self.imageView];
}

- (void)jump {
    QQSecondViewController *controller = [[QQSecondViewController alloc] init];
    controller.transitioningDelegate = self;
    controller.delegate = self;
    [self.interactiveTransition connectToViewController:controller view:controller.imageView];
    [self presentViewController:controller animated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.jumpAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.downAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
}

- (void)secondViewControllerDidClickedDismissButton:(QQSecondViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

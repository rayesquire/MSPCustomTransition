//
//  MainViewController.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/3/24.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "PopDismissAnimation.h"
#import "BouncePushAnimation.h"
#import "SwipeRightInteractiveTransition.h"

@interface MainViewController () <UIViewControllerTransitioningDelegate,ViewControllerDelegate>

@property (nonatomic, readwrite, strong) BouncePushAnimation *pushAnimation;

@property (nonatomic, readwrite, strong) SwipeRightInteractiveTransition *rightTransitionController;

@property (nonatomic, readwrite, strong) PopDismissAnimation *popDismissAnimation;

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        _pushAnimation = [BouncePushAnimation new];
        _rightTransitionController = [SwipeRightInteractiveTransition new];
        _popDismissAnimation = [PopDismissAnimation new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonClicked:(id)sender
{
    ViewController *mvc = [[ViewController alloc] init];
    mvc.delegate = self;
    mvc.transitioningDelegate = self;
    [self.rightTransitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

-(void)viewControllerDidClickedDismissButton:(ViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.pushAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.popDismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.rightTransitionController.interacting ? self.rightTransitionController : nil;
}

@end

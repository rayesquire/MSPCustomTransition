//
//  ViewController.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/3/24.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:180/255.0 blue:225/255.0 alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewControllerDidClickedDismissButton:)]) {
        [self.delegate viewControllerDidClickedDismissButton:self];
    }
}
@end

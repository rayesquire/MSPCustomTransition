//
//  QQSecondViewController.m
//  CustomTransition
//
//  Created by 马了个马里奥 on 16/5/28.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "QQSecondViewController.h"
#import "DownAnimation.h"

@interface QQSecondViewController ()

@property (nonatomic, readwrite, strong) UITapGestureRecognizer *pan;

@property (nonatomic, readwrite, strong) UIPercentDrivenInteractiveTransition *interaction;

@end

@implementation QQSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 80, 150, 160, 160)];
        _imageView.layer.cornerRadius = 80;
        _imageView.layer.masksToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"bkg.jpeg"];
        _imageView.userInteractionEnabled = YES;
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

@end

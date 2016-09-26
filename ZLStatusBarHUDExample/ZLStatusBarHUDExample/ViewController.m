//
//  ViewController.m
//  ZLStatusBarHUDExample
//
//  Created by hezhonglin on 16/9/26.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ViewController.h"
#import "ZLStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)hide:(id)sender {
    [ZLStatusBarHUD hide];
}
- (IBAction)showMessage:(id)sender {
    [ZLStatusBarHUD showMessage:@"哈哈哈" image:nil];
}
- (IBAction)loading:(id)sender {
    [ZLStatusBarHUD showLoading];
}
- (IBAction)showError:(id)sender {
    [ZLStatusBarHUD showErrorWithMessage:@"加载失败"];
}

- (IBAction)showSuccess:(id)sender {
    [ZLStatusBarHUD showSuccessWithMessage:@"加载成功"];
}
@end

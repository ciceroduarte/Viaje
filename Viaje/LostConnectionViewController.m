//
//  LostConnectionViewController.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "LostConnectionViewController.h"

@interface LostConnectionViewController ()

@end

@implementation LostConnectionViewController

- (void)viewWillAppear:(BOOL)animated {
    _buttonTryAgain.layer.cornerRadius = 5;
    _buttonTryAgain.layer.borderWidth = 0.5;
    _buttonTryAgain.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tryAgain:(id)sender {
    [_delegate tryAgainSelected];
}

@end

//
//  LostConnectionViewController.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LostConnectionDelegate <NSObject>

- (void) tryAgainSelected;

@end

@interface LostConnectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonTryAgain;

@property (weak, nonatomic) id <LostConnectionDelegate> delegate;

- (IBAction)tryAgain:(id)sender;

@end

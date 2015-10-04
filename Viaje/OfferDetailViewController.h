//
//  OfferDetailViewController.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service.h"
#import "OfferDetailTableController.h"
#import "LostConnectionViewController.h"

@interface OfferDetailViewController : UIViewController <LostConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *lostConnectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *purchaseButtonHeight;


@property (strong, nonatomic) Offer * offer;
@property (strong, nonatomic) OfferDetailTableController * tableViewController;
@property (strong, nonatomic) LostConnectionViewController * lostConnection;

- (IBAction)purchaseOffer:(id)sender;

@end

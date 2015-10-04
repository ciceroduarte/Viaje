//
//  OffersViewController.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service.h"
#import "OffersTableController.h"
#import "LostConnectionViewController.h"
#import "OfferDetailViewController.h"
#import "LocationManager.h"

@interface OffersViewController : UIViewController <LostConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *lostConnectionView;

@property (strong, nonatomic) NSMutableArray * arrayOffers;
@property (strong, nonatomic) OffersTableController * tableViewController;
@property (strong, nonatomic) LostConnectionViewController * lostConnection;
@property (strong, nonatomic) LocationManager * locationManager;

@end

//
//  OffersTableViewController.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "OfferTableViewCell.h"

@interface OffersTableController : NSObject <UITableViewDelegate, UITableViewDataSource>

- (id) initWithArrayOffers:(NSMutableArray *)arrayOffers andViewController:(UIViewController *)vc;

@property (strong, nonatomic) UIViewController * vc;
@property (strong, nonatomic) NSMutableArray * arrayOffers;

@end

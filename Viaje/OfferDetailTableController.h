//
//  OfferDetailTableController.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Offer.h"
#import "OfferTableViewCell.h"
#import "OfferDetailTableViewCell.h"

@interface OfferDetailTableController : NSObject <UITableViewDelegate, UITableViewDataSource>

- (id) initWithOffer:(Offer *)offer;

@property (strong, nonatomic) Offer * offer;

@end

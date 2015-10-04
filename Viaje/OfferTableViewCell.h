//
//  CellOffer.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Offer.h"

@interface OfferTableViewCell : UITableViewCell {
    IBOutlet UIImageView *imageOffer;
    IBOutlet UILabel * labelName;
    IBOutlet UILabel * labelPrice;
    IBOutlet UIActivityIndicatorView * activityIndicator;
}

- (void) configure:(Offer *) offer;

@end

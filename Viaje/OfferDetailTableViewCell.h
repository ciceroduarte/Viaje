//
//  OfferDescriptionTableViewCell.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Offer.h"

@interface OfferDetailTableViewCell : UITableViewCell {
    IBOutlet UILabel * labelDescription;
    IBOutlet UILabel * labelTitle;
}


- (void) configure:(Offer *) offer;

@end

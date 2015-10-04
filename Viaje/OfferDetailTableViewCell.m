//
//  OfferDescriptionTableViewCell.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OfferDetailTableViewCell.h"

@implementation OfferDetailTableViewCell

- (void)configure:(Offer *)offer {
    labelDescription.text = @"";
    labelTitle.text = @"";
    
    if(![offer descriptionEmptyOrNil]) {
        labelDescription.text = offer.offerDescription;
        labelTitle.text = NSLocalizedString(@"Descrição", nil);
    }
}
@end

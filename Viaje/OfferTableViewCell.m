//
//  CellOffer.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OfferTableViewCell.h"

@implementation OfferTableViewCell


- (void)configure:(Offer *)offer {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    labelName.text = offer.name;
    labelPrice.text = [offer getPrice];
    labelPrice.textAlignment = NSTextAlignmentCenter;
    imageOffer.image = [[UIImage alloc] init];
    
    [activityIndicator startAnimating];
    activityIndicator.hidden = NO;
    
    [manager downloadImageWithURL:[offer getImageURL] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        imageOffer.image = image;
        imageOffer.clipsToBounds = YES;
        
        [activityIndicator stopAnimating];
        activityIndicator.hidden = YES;
    }];    
}

- (UIEdgeInsets)layoutMargins {
    return UIEdgeInsetsZero;
}

@end

//
//  OfferDetailTableController.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OfferDetailTableController.h"

@implementation OfferDetailTableController

- (id)initWithOffer:(Offer *)offer {
    self = [super init];
    if(self){
        _offer = offer;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = nil;
    
    if(indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_offer"];
        [(OfferTableViewCell *)cell configure:_offer];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_detail"];
        [(OfferDetailTableViewCell *)cell configure:_offer];
    }
    
    return cell;
}


@end

//
//  OffersTableViewController.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OffersTableController.h"

@implementation OffersTableController

- (id)initWithArrayOffers:(NSMutableArray *)arrayOffers andViewController:(UIViewController *)vc{
    self = [super init];
    if(self) {
        _arrayOffers = arrayOffers;
        _vc = vc;
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
    return _arrayOffers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Offer * offer = [_arrayOffers objectAtIndex:indexPath.row];
    
    OfferTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell_offer"];
    [cell configure:offer];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_vc performSegueWithIdentifier:SEGUE_OFFER_DETAIL sender:_vc];
}


@end

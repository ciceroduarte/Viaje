//
//  Offer.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Offer : JSONModel

@property (strong, nonatomic) NSNumber * identifier;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * price;
@property (strong, nonatomic) NSString * offerDescription;
@property (strong, nonatomic) NSString * image;
@property (assign, nonatomic) BOOL purchased;

- (BOOL) descriptionEmptyOrNil;

- (NSURL *) getImageURL;
- (NSString *)getPrice;

- (NSDictionary *) getParametersDetail;
- (NSDictionary *) getParametersPurchase;

@end

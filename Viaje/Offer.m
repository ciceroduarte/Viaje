//
//  Offer.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "Offer.h"

@implementation Offer

- (NSURL *)getImageURL {
    return [NSURL URLWithString:_image];
}

- (NSString *)getPrice {
    return [NSString stringWithFormat:@"R$%@  ", _price];
}

- (NSDictionary *)getParametersDetail {
    return [NSDictionary dictionaryWithObjectsAndKeys:_identifier, @"id", nil];
}

- (NSDictionary *)getParametersPurchase {
    return [NSDictionary dictionaryWithObjectsAndKeys:_identifier, @"id", nil];
}

- (BOOL)descriptionEmptyOrNil {
    return !_offerDescription || _offerDescription.length == 0;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"identifier", @"desc": @"offerDescription" }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

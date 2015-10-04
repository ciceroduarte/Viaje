//
//  Service.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SVProgressHud.h"
#import "LocationManager.h"

#define TIMEOUT 30

@interface Service : NSObject

- (void) executeWithURL:(NSString *)url parameters:(NSDictionary *)parameters progressMessage:(NSString *)progressMessage sucess:(void (^)(NSData *response))success error:(void (^)(NSData * response, int statusCode))error;

@end

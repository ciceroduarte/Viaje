//
//  Service.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "Service.h"

@implementation Service

- (void)executeWithURL:(NSString *)url parameters:(NSDictionary *)parameters progressMessage:(NSString *)progressMessage sucess:(void (^)(NSData *))success error:(void (^)(NSData *, int))error {
    
    url = [NSString stringWithFormat:@"%@%@", URL_BASE, url];
    
    NSMutableURLRequest * request = [self getRequestWithURL:url andParameters:parameters];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD dismiss];
        success(operation.responseData);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *er) {
        [SVProgressHUD dismiss];
        
        int statusCode = (int) operation.response.statusCode;
        
        error(operation.responseData, statusCode);
        
        if(statusCode == 500) {
            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"The server does not respond. Try again later", nil)];
        }
    }];
    
    [SVProgressHUD showWithStatus:NSLocalizedString(progressMessage, nil) maskType:SVProgressHUDMaskTypeBlack];
    [op start];
}

- (NSMutableURLRequest *) getRequestWithURL:(NSString *)url andParameters:(NSDictionary *)parameters {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", url]] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:TIMEOUT];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"Basic: someValue" forHTTPHeaderField:@"Authorization"];
    [request setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: [[self getParameters:parameters] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

- (NSString *)getParameters:(NSDictionary *)parameters {
    NSMutableDictionary * defaultsParameters = nil;
    if(parameters) {
        defaultsParameters = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    } else {
        defaultsParameters = [[NSMutableDictionary alloc] init];
    }
    
    NSUserDefaults * config = [NSUserDefaults standardUserDefaults];
    NSString * lat = [config objectForKey:@"lat"];
    NSString * lng = [config objectForKey:@"lng"];
    NSString * osVersion = [[UIDevice currentDevice] systemVersion];
    NSString * appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    
    [defaultsParameters setObject:osVersion forKey:@"osVersion"];
    [defaultsParameters setObject:appVersion forKey:@"appVersion"];
    if(lat && lng) {
        [defaultsParameters setObject:lat forKey:@"lat"];
        [defaultsParameters setObject:lng forKey:@"lng"];
    }

    NSError* error;
    NSData* jsonDataResult = [NSJSONSerialization dataWithJSONObject:defaultsParameters options:NSJSONWritingPrettyPrinted error:&error];
    NSString* parametersString = [[NSString alloc] initWithData:jsonDataResult encoding:NSUTF8StringEncoding];
    return parametersString;
}

@end

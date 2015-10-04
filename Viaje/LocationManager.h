//
//  LocationManager.h
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager * locationManager;
@property (strong, nonatomic) CLLocation * actualLocation;

+ (id) getInstance;

- (void) startMonitoringLocationUpdate;
- (void) stopMonitoringLocationUpdate;

- (void) verifyLocationManager;

@end

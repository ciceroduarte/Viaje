//
//  LocationManager.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

- (id) init {
    if (self = [super init]) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return self;
}

+ (id) getInstance {
    static LocationManager * locationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        locationManager = [[self alloc] init];
    });
    return locationManager;
}

- (void)verifyLocationManager {
    NSUInteger code = [CLLocationManager authorizationStatus];
    if (code == kCLAuthorizationStatusNotDetermined || ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)] || [_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
        if (IS_OS_8_OR_LATER) {
            [[UIApplication sharedApplication] sendAction:@selector(requestWhenInUseAuthorization) to:_locationManager from:self forEvent:nil];
        }
    }
}

- (void) startMonitoringLocationUpdate {
    if ([CLLocationManager locationServicesEnabled]) {
        [_locationManager startUpdatingLocation];
        [_locationManager startMonitoringSignificantLocationChanges];
    }
}

- (void) stopMonitoringLocationUpdate {
    [_locationManager stopUpdatingLocation];
    [_locationManager stopMonitoringSignificantLocationChanges];
}

- (void) locationManager:(CLLocationManager *) manager didUpdateLocations:(NSArray *)locations {
    _actualLocation = [locations lastObject];
    [self setLocation];
}

- (void)setLocation {
    
    if(_actualLocation) {
        NSString * lat = [NSString stringWithFormat:@"%f", _actualLocation.coordinate.latitude];
        NSString * lng = [NSString stringWithFormat:@"%f", _actualLocation.coordinate.longitude];
        
        NSUserDefaults * config = [NSUserDefaults standardUserDefaults];
        [config setObject:lat forKey:@"lat"];
        [config setObject:lng forKey:@"lng"];
        [config synchronize];
    }
}

@end

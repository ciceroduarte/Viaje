//
//  OffersViewController.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OffersViewController.h"

@implementation OffersViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"Viaje";
    [_locationManager startMonitoringLocationUpdate];
}

- (void)viewDidAppear:(BOOL)animated {
    [_locationManager verifyLocationManager];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationItem.title = @"";
    [_locationManager stopMonitoringLocationUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayOffers = [[NSMutableArray alloc] init];
    
    _locationManager = [[LocationManager alloc] init];
    
    [self initTableView];
    [self searchOffers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_OFFER_DETAIL]) {
        OfferDetailViewController * vc = [segue destinationViewController];
        vc.offer = [_arrayOffers objectAtIndex:[_tableView indexPathForSelectedRow].row];
    }
    
    if([segue.identifier isEqualToString:SEGUE_LOST_CONNECTION]) {
        _lostConnection = [segue destinationViewController];
        _lostConnection.delegate = self;
    }
}

- (void) initTableView {
    _tableViewController = [[OffersTableController alloc] initWithArrayOffers:_arrayOffers andViewController:self];
    _tableView.delegate = _tableViewController;
    _tableView.dataSource = _tableViewController;
    _tableView.hidden = YES;
}

- (void) searchOffers {
    Service * service = [[Service alloc] init];
    
    [service executeWithURL:URL_OFFERS parameters:nil progressMessage:@"Buscando ofertas" sucess:^(NSData *response) {
        NSArray * arrayResult = [Offer arrayOfModelsFromData:response error:nil];
        [_arrayOffers addObjectsFromArray:arrayResult];
        [_tableView reloadData];
        _tableView.hidden = NO;
        _lostConnectionView.hidden = YES;
    } error:^(NSData *response, int statusCode) {
        _lostConnectionView.hidden = NO;
    }];
}

#pragma Lost Connection Delegate
-(void)tryAgainSelected {
    [self searchOffers];
}

@end

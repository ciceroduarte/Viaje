//
//  OfferDetailViewController.m
//  Viaje
//
//  Created by Cicero on 03/10/15.
//  Copyright © 2015 ciceroduarte. All rights reserved.
//

#import "OfferDetailViewController.h"

@interface OfferDetailViewController ()

@end

@implementation OfferDetailViewController

- (void) viewWillAppear:(BOOL)animated {
    self.navigationItem.title = NSLocalizedString(@"Detalhe", nil);
    
    if(_offer.purchased){
        [self hidePurchaseButtonAnimated:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self searchOffer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SEGUE_LOST_CONNECTION]) {
        _lostConnection = [segue destinationViewController];
        _lostConnection.delegate = self;
    }
}

- (void) initTableView {
    _tableViewController = [[OfferDetailTableController alloc] initWithOffer:_offer];
    _tableView.delegate = _tableViewController;
    _tableView.dataSource = _tableViewController;
}

- (void) hidePurchaseButtonAnimated:(BOOL)animated {
    _purchaseButtonHeight.constant = 0;
    if(animated){
        [UIView animateWithDuration:.3 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void) searchOffer {
    if([_offer descriptionEmptyOrNil]) {
        Service * service = [[Service alloc] init];
        
        [service executeWithURL:URL_OFFER_DETAIL parameters:[_offer getParametersDetail] progressMessage:@"Buscando oferta" sucess:^(NSData *response) {
            Offer * offerResult = [[Offer alloc] initWithData:response error:nil];
            _offer.offerDescription = offerResult.offerDescription;
            
            [_tableView reloadData];

            _lostConnectionView.hidden = YES;
        } error:^(NSData *response, int statusCode) {
            _lostConnectionView.hidden = NO;
        }];
    }
}

- (void)purchaseOffer:(id)sender {
    Service * service = [[Service alloc] init];
    
    [service executeWithURL:URL_PURCHASE parameters:[_offer getParametersPurchase] progressMessage:@"Efetuando compra" sucess:^(NSData *response) {
        [self hidePurchaseButtonAnimated:YES];
        _offer.purchased = YES;

        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"Compra realizada com sucesso", nil)];
        
    } error:^(NSData *response, int statusCode) {
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Falha ao efetuar compra", nil)];
    }];
}

#pragma Lost Connection Delegate
-(void)tryAgainSelected {
    [self searchOffer];
}

@end

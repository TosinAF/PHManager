//
//  PHViewController.m
//  PHManagerClient
//
//  Created by Tosin Afolabi on 15/06/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "PHManager.h"
#import "PHViewController.h"

@interface PHViewController ()

@end

@implementation PHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Test getting today's products

    [[PHManager sharedManager] getTodaysProductsWithSuccess:^(NSArray *products) {

        NSLog(@"Products Download Successful");

        for (PHProduct *product in products) {
            NSLog(@"%@", [product titleWithTagline]);
            NSLog(@"%@", [[product hunter] name]);
        }

        // Test getting comments for a product
        PHProduct *topProduct = products[0];
        [self getCommentsForProduct:topProduct];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        NSLog(@"The task: %@ failed with error: %@", task, error);

    }];
}

- (void)getCommentsForProduct:(PHProduct *)product
{

    [[PHManager sharedManager] getCommentsForProduct:product success:^(NSArray *comments) {

        NSLog(@"Comments Download Successful");

        for (PHComment *comment in comments) {
            NSLog(@"%@", [comment comment]);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        NSLog(@"The task: %@ failed with error: %@", task, error);
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

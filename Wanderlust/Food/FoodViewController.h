//
// Created by Jon Andersen on 23/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SwipeView/SwipeView.h>

@class FoodViewModel;
@class ImageService;
@class SwipeView;
@class SwipeViewDataSource;


@interface FoodViewController : UIViewController

@property(nonatomic, strong) FoodViewModel *sight;
@property (weak, nonatomic) IBOutlet SwipeView *swipeView;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property(nonatomic, strong) ImageService *imageService;
@property(nonatomic, strong) SwipeViewDataSource *swipeViewDataSource;
@end
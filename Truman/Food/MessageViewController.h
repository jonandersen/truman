//
// Created by Jon Andersen on 23/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SwipeView/SwipeView.h>

@class MessageViewModel;
@class ImageService;
@class SwipeView;
@class SwipeViewDataSource;


@interface MessageViewController : UIViewController

@property(nonatomic, strong) MessageViewModel *messageViewModel;
@property (weak, nonatomic) IBOutlet SwipeView *swipeView;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property(nonatomic, strong) ImageService *imageService;
@property(nonatomic, strong) SwipeViewDataSource *swipeViewDataSource;
@end
//
// Created by Jon Andersen on 25/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SwipeView/SwipeView.h>
typedef UIView *  (^SwipeViewViewConfig)(UIView *, id);

@interface SwipeViewDataSource : NSObject<SwipeViewDelegate, SwipeViewDataSource>

@property(nonatomic, copy) SwipeViewViewConfig swipeViewViewConfigBlock;

- (instancetype)initWithImages:(NSArray *)items;

@end
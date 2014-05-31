//
// Created by Jon Andersen on 25/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "SwipeViewDataSource.h"


@interface SwipeViewDataSource()
    @property(nonatomic, strong) NSArray *items;
@end

@implementation SwipeViewDataSource {

}

- (instancetype)init {
    return nil;
}
- (instancetype)initWithImages:(NSArray *)items {
    if(self = [super init]) {
        self.items = items;
    }
    return self;
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView {
    return [self.items count];
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    id item = [self.items objectAtIndex:(NSUInteger) index];
    return self.swipeViewViewConfigBlock(view,item);
}


@end
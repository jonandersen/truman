//
// Created by Jon Andersen on 23/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "DataAccessStore.h"
#import "SightViewModel.h"


@implementation DataAccessStore {

}
- (NSArray *)sightViewModels {
    NSMutableArray *sightModels = [[NSMutableArray alloc] initWithCapacity:5];
    for(int i = 0; i< 5; i ++){
        SightViewModel* viewModel = [[SightViewModel alloc] init];
        [sightModels addObject:viewModel];
    }

    return sightModels;
}

@end
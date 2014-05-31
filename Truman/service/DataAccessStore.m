//
// Created by Jon Andersen on 23/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "DataAccessStore.h"
#import "MessageViewModel.h"


@implementation DataAccessStore {

}
- (NSArray *)sightViewModels {
    NSMutableArray *sightModels = [[NSMutableArray alloc] initWithCapacity:5];
    for(int i = 0; i< 5; i ++){
        MessageViewModel * viewModel = [[MessageViewModel alloc] init];
        viewModel.name = [NSString stringWithFormat:@"ViewModel%i",i];
        viewModel.picture = [NSURL URLWithString:[NSString stringWithFormat:@"missingImage"]];
        viewModel.country = @"Germany";
        viewModel.region = @"Bavaria";
        [sightModels addObject:viewModel];
    }

    return sightModels;
}

@end
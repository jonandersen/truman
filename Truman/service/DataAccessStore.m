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
        viewModel.message = [NSString stringWithFormat:@"%i Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra ac diam sed facilisis. Quisque quis imperdiet odio, ac elementum sapien. Nulla vulputate ligula quis tincidunt varius. Phasellus pulvinar, est sit amet posuere pellentesque, erat augue molestie massa, eget vehicula sem dolor ut sapien. Mauris faucibus magna vel nisl commodo, eu porta sapien fringilla. Curabitur quis elit gravida, pulvinar ante quis, varius ipsum. Praesent in ante diam. END",i];
        viewModel.poster = [NSString stringWithFormat:@"Poster%i",i];
        [sightModels addObject:viewModel];
    }

    return sightModels;
}

@end
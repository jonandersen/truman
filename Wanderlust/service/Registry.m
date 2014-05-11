#import "Registry.h"
#import "FoodDataSource.h"
#import "DataAccessStore.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"


@implementation Registry {

}
- (FoodDataSource *)sightDataSource {
    DataAccessStore *dataAccessStore = [[DataAccessStore alloc] init];
    return [[FoodDataSource alloc] initWithStore:dataAccessStore];
}

- (ImageService *)imageService {
    return [[ImageService alloc] init];
}

- (SwipeViewDataSource *)swipeViewDataSource {
    return [[SwipeViewDataSource alloc] initWithImages:nil];
}


@end
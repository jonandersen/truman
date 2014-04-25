#import "Registry.h"
#import "SightDataSource.h"
#import "DataAccessStore.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"


@implementation Registry {

}
- (SightDataSource *)sightDataSource {
    DataAccessStore *dataAccessStore = [[DataAccessStore alloc] init];
    return [[SightDataSource alloc] initWithStore:dataAccessStore];
}

- (ImageService *)imageService {
    return [[ImageService alloc] init];
}

- (SwipeViewDataSource *)swipeViewDataSource {
    return [[SwipeViewDataSource alloc] initWithImages:nil];
}


@end
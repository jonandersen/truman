#import "Registry.h"
#import "MessageDataSource.h"
#import "DataAccessStore.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"


@implementation Registry {

}
- (MessageDataSource *)sightDataSource {
    DataAccessStore *dataAccessStore = [[DataAccessStore alloc] init];
    return [[MessageDataSource alloc] initWithStore:dataAccessStore];
}

- (ImageService *)imageService {
    return [[ImageService alloc] init];
}

- (SwipeViewDataSource *)swipeViewDataSource {
    return [[SwipeViewDataSource alloc] initWithImages:nil];
}


@end
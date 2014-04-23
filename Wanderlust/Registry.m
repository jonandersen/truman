#import "Registry.h"
#import "SightDataSource.h"
#import "DataAccessStore.h"


@implementation Registry {

}
- (SightDataSource *)sightDataSource {
    DataAccessStore *dataAccessStore = [[DataAccessStore alloc] init];
    return [[SightDataSource alloc] initWithStore:dataAccessStore];
}

@end
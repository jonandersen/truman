
#import "SightViewCell.h"
#import "SightViewModel.h"

@class DataAccessStore;

typedef void (^BannerTableViewCellConfigureBlock)(SightViewCell *cell, SightViewModel *item);

@interface SightDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) BannerTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore;



@end
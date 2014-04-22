
#import "SightViewCell.h"
#import "SightViewModel.h"

typedef void (^BannerTableViewCellConfigureBlock)(SightViewCell *cell, SightViewModel *item);

@interface SightDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) BannerTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithSights:(NSArray *)sights;


@end
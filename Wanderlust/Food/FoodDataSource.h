
#import "FoodViewCell.h"
#import "FoodViewModel.h"

@class DataAccessStore;

typedef void (^BannerTableViewCellConfigureBlock)(FoodViewCell *cell, FoodViewModel *item);

@interface FoodDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) BannerTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore;


- (FoodViewModel *)sightForIndexPath:(NSIndexPath *)indexPath;
@end
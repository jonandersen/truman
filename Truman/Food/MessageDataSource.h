
#import "ImageViewCell.h"
#import "MessageViewModel.h"

@class DataAccessStore;

typedef void (^BannerTableViewCellConfigureBlock)(ImageViewCell *cell, MessageViewModel *item);

@interface MessageDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) BannerTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore;


- (MessageViewModel *)sightForIndexPath:(NSIndexPath *)indexPath;
@end
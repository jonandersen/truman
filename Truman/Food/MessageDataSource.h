
#import "MessageViewCell.h"
#import "MessageViewModel.h"

@class DataAccessStore;

typedef void (^BannerTableViewCellConfigureBlock)(MessageViewCell *cell, MessageViewModel *item);

@interface MessageDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) BannerTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore;


- (MessageViewModel *)sightForIndexPath:(NSIndexPath *)indexPath;
@end
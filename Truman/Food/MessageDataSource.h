
#import "ImageViewCell.h"
#import "MessageViewModel.h"

@class DataAccessStore;
@class MessageViewCell;

typedef void (^MessageTableViewCellConfigureBlock)(MessageViewCell *cell, MessageViewModel *item);

@interface MessageDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) MessageTableViewCellConfigureBlock sightConfigure;

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore;


- (MessageViewModel *)sightForIndexPath:(NSIndexPath *)indexPath;
@end

#import "BannerTableViewCell.h"

typedef void (^BannerTableViewCellConfigureBlock)(id cell, id item);

@interface SightDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>


- (instancetype) initWithConfigure:(BannerTableViewCellConfigureBlock)bannerCellConfigure;



@end
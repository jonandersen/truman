
#import "BannerTableViewCell.h"

typedef void (^BannerTableViewCellConfigureBlock)(id cell, id item);

@interface SightDataSource : NSObject <UITableViewDataSource>


- (instancetype) initWithConfigure:(BannerTableViewCellConfigureBlock)bannerCellConfigure;



@end
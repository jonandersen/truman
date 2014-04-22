#import "SightViewModel.h"

@class SightDataSource;

@interface SightViewController : UITableViewController

@property(strong, nonatomic) SightViewModel *sight;
@property(strong, nonatomic)  SightDataSource *sightDataSource;

@end
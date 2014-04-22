#import <UIKit/UIKit.h>
#import "SightViewModel.h"

@class SightDataSource;

@interface SightViewController : UIViewController

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) SightViewModel *sight;
@property(strong, nonatomic)  SightDataSource *sightDataSource;

@end
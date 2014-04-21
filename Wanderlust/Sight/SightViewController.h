#import <UIKit/UIKit.h>
#import "SightViewModel.h"

@interface SightViewController : UIViewController <UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) SightViewModel *sight;

- (instancetype)initWithSight:(SightViewModel *)sight;

@end
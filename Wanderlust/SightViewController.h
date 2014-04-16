#import <UIKit/UIKit.h>
#import "Sight.h"

@interface SightViewController : UIViewController <UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) Sight *sight;

- (instancetype)initWithSight:(Sight *)sight;

@end
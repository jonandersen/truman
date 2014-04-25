#import "SightViewModel.h"

@class SightDataSource;
@class Registry;

@interface HomeViewController : UIViewController

@property(strong, nonatomic) SightViewModel *sight;
@property(strong, nonatomic)  SightDataSource *sightDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id imageService;
@property(nonatomic, strong) Registry *registry;
@end
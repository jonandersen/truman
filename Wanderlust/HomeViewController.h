#import "FoodViewModel.h"

@class FoodDataSource;
@class Registry;

@interface HomeViewController : UIViewController

@property(strong, nonatomic) FoodViewModel *sight;
@property(strong, nonatomic)  FoodDataSource *sightDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id imageService;
@property(nonatomic, strong) Registry *registry;
@end
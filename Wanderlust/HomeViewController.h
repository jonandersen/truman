#import "FoodViewModel.h"

@class FoodDataSource;
@class Registry;

@interface HomeViewController : UIViewController

@property(strong, nonatomic) FoodViewModel *foodViewModel;
@property(strong, nonatomic)  FoodDataSource *foodDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id imageService;
@property(nonatomic, strong) Registry *registry;
@end
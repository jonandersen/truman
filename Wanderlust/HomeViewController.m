#import "HomeViewController.h"
#import "FoodDataSource.h"
#import "FoodViewController.h"
#import "ImageService.h"
#import "Registry.h"

@implementation HomeViewController

- (void)dealloc {
    self.foodDataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [RACObserve(self, foodViewModel.name) subscribeNext:^(NSString*  name) {
        self.title = name;
    }];
    __weak HomeViewController* weakSelf = self;
    self.foodDataSource.sightConfigure = ^(FoodViewCell *cell, FoodViewModel *sight ){
        cell.titleLabel.text = sight.name;
        cell.sightImageView.image = [weakSelf.imageService imageForUrl:sight.picture];
    };
    self.tableView.delegate = self.foodDataSource;
    self.tableView.dataSource = self.foodDataSource;
    

    // Do any additional setup after loading the view.
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FoodViewModel *sightViewModel =  [self.foodDataSource sightForIndexPath:[self.tableView indexPathForSelectedRow]];
    FoodViewController *sightViewController =[segue destinationViewController];
    sightViewController.sight = sightViewModel;
    sightViewController.imageService = self.imageService;
    sightViewController.swipeViewDataSource = [self.registry swipeViewDataSource];
}


@end
#import "HomeViewController.h"
#import "SightDataSource.h"
#import "SightViewController.h"

@implementation HomeViewController

- (void)dealloc {
    self.sightDataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [RACObserve(self, sight.title) subscribeNext:^(NSString*  title) {
        self.title = title;
    }];
    self.sightDataSource.sightConfigure = ^(SightViewCell *cell, SightViewModel *sight ){
        cell.titleLabel.text = sight.title;
        cell.sightImageView.image = [UIImage imageNamed:[sight.picture absoluteString]];
    };
    self.tableView.delegate = self.sightDataSource;
    self.tableView.dataSource = self.sightDataSource;
    

    // Do any additional setup after loading the view.
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SightViewModel *sightViewModel =  [self.sightDataSource sightForIndexPath:[self.tableView indexPathForSelectedRow]];
    SightViewController *sightViewController =[segue destinationViewController];
    sightViewController.sight = sightViewModel;
    sightViewController.imageService = self.imageService;
}


@end
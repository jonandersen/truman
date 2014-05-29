#import "HomeViewController.h"
#import "MessageDataSource.h"
#import "MessageViewController.h"
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
    self.foodDataSource.sightConfigure = ^(MessageViewCell *cell, MessageViewModel *sight ){
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
    MessageViewModel *sightViewModel =  [self.foodDataSource sightForIndexPath:[self.tableView indexPathForSelectedRow]];
    MessageViewController *sightViewController =[segue destinationViewController];
    sightViewController.sight = sightViewModel;
    sightViewController.imageService = self.imageService;
    sightViewController.swipeViewDataSource = [self.registry swipeViewDataSource];
}


@end
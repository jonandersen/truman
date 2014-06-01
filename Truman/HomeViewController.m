#import "HomeViewController.h"
#import "MessageDataSource.h"
#import "MessageViewController.h"
#import "ImageService.h"
#import "Registry.h"
#import "MessageViewCell.h"

@implementation HomeViewController

- (void)dealloc {
    self.messageDataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [RACObserve(self, messageViewModel.poster) subscribeNext:^(NSString*  name) {
        self.title = name;
    }];
    self.messageDataSource.sightConfigure = ^(MessageViewCell *cell, MessageViewModel *messageViewModel){
        cell.messageLabel.text = messageViewModel.message;
        [cell setNeedsLayout];
    };
    self.tableView.delegate = self.messageDataSource;
    self.tableView.dataSource = self.messageDataSource;
    

    // Do any additional setup after loading the view.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    MessageViewModel *sightViewModel =  [self.messageDataSource sightForIndexPath:[self.tableView indexPathForSelectedRow]];
    MessageViewController *sightViewController =[segue destinationViewController];
    sightViewController.messageViewModel = sightViewModel;
    sightViewController.imageService = self.imageService;
    sightViewController.swipeViewDataSource = [self.registry swipeViewDataSource];
}


@end
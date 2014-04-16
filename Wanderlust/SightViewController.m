#import "SightViewController.h"
#import "SightDataSource.h"

@interface SightViewController () {
    SightDataSource *_sightDataSource;
}

@end

@implementation SightViewController

-(instancetype) initWithSight:(Sight *) sight {
    if(self = [super init]) {
        _sightDataSource = [[SightDataSource alloc] initWithConfigure:^(id cell, id url){}];
        self.sight = sight;
    }
    return self;
}

- (void)dealloc {
    _sightDataSource = nil;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [RACObserve(self, sight.title) subscribeNext:^(NSString*  title) {
        self.title = title;
    }];
    self.tableView.dataSource = _sightDataSource;

    // Do any additional setup after loading the view.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
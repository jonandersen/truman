#import "MessageViewModel.h"

@class MessageDataSource;
@class Registry;

@interface HomeViewController : UIViewController

@property(strong, nonatomic) MessageViewModel *messageViewModel;
@property(strong, nonatomic)  MessageDataSource *messageDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id imageService;
@property(nonatomic, strong) Registry *registry;
@end
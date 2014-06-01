#import "MessageDataSource.h"
#import "DataAccessStore.h"
#import "MessageViewCell.h"

@interface MessageDataSource ()

    @property (strong, nonatomic) NSArray *messages;
    @property (strong, nonatomic) MessageViewCell *messageViewCell;
    @property (nonatomic, strong) DataAccessStore* dataAccessStore;

@end

@implementation MessageDataSource

- (instancetype)init {
    return nil;
}

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore {
    if (self  = [super init]) {
        self.dataAccessStore = dataAccessStore;
        self.messages = [self.dataAccessStore sightViewModels];
    }
    return self;
}

- (void) dealloc {
    self.messages = nil;
    self.messageViewCell = nil;
    self.dataAccessStore = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    MessageViewCell *cell = [self sightViewCellFromTable:tableView];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    MessageViewModel *messageViewModel = [self.messages objectAtIndex:(NSUInteger) [indexPath section]];
    self.sightConfigure(cell, messageViewModel);
    
    return [cell height];
 
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.messages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageCellIdentifier];
    MessageViewModel *sight = [self.messages objectAtIndex:(NSUInteger) [indexPath section]];
    self.sightConfigure(cell, sight);

    return cell;

}


- (MessageViewCell *)sightViewCellFromTable:(UITableView *) tableView {
    if (!self.messageViewCell) {
        self.messageViewCell = [tableView dequeueReusableCellWithIdentifier:MessageCellIdentifier];
    }
    return self.messageViewCell;
}

- (MessageViewModel *)sightForIndexPath:(NSIndexPath *)indexPath {
    return [[self messages] objectAtIndex:(NSUInteger) [indexPath section]];
}
@end
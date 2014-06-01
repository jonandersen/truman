#import "MessageDataSource.h"
#import "DataAccessStore.h"

@interface MessageDataSource ()

    @property (strong, nonatomic) NSArray *food;
    @property (strong, nonatomic) ImageViewCell *foodViewCell;
    @property (nonatomic, strong) DataAccessStore* dataAccessStore;

@end

@implementation MessageDataSource

- (instancetype)init {
    return nil;
}

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore {
    if (self  = [super init]) {
        self.dataAccessStore = dataAccessStore;
        self.food = [self.dataAccessStore sightViewModels];
    }
    return self;
}

- (void) dealloc {
    self.food = nil;
    self.foodViewCell = nil;
    self.dataAccessStore = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageViewCell *cell = [self sightViewCellFromTable:tableView];
    return [cell height];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.food count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCellIdentifier];
    MessageViewModel *sight = [self.food objectAtIndex:(NSUInteger) [indexPath section]];
    self.sightConfigure(cell, sight);

    return cell;

}


- (ImageViewCell *)sightViewCellFromTable:(UITableView *) tableView {
    if (!self.foodViewCell) {
        self.foodViewCell = [tableView dequeueReusableCellWithIdentifier:ImageCellIdentifier];
    }
    return self.foodViewCell;
}

- (MessageViewModel *)sightForIndexPath:(NSIndexPath *)indexPath {
    return [[self food] objectAtIndex:(NSUInteger) [indexPath section]];
}
@end
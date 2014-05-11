#import "FoodDataSource.h"
#import "DataAccessStore.h"

@interface FoodDataSource ()

    @property (strong, nonatomic) NSArray *sights;
    @property (strong, nonatomic) FoodViewCell *sightViewCell;
    @property (nonatomic, strong) DataAccessStore* dataAccessStore;

@end

@implementation FoodDataSource

- (instancetype)init {
    return nil;
}

- (instancetype) initWithStore:(DataAccessStore *)dataAccessStore {
    if (self  = [super init]) {
        self.dataAccessStore = dataAccessStore;
        self.sights = [self.dataAccessStore sightViewModels];
    }
    return self;
}

- (void) dealloc {
    self.sights = nil;
    self.sightViewCell = nil;
    self.dataAccessStore = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodViewCell *cell = [self sightViewCellFromTable:tableView];
    return [cell height];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sights count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    FoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier];
    FoodViewModel *sight = [self.sights objectAtIndex:(NSUInteger) [indexPath section]];
    self.sightConfigure(cell, sight);

    return cell;

}


- (FoodViewCell *)sightViewCellFromTable:(UITableView *) tableView {
    if (!self.sightViewCell) {
        self.sightViewCell = [tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier];
    }
    return self.sightViewCell;
}

- (FoodViewModel *)sightForIndexPath:(NSIndexPath *)indexPath {
    return [[self sights] objectAtIndex:(NSUInteger) [indexPath section]];
}
@end
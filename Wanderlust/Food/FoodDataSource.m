#import "FoodDataSource.h"
#import "DataAccessStore.h"

@interface FoodDataSource ()

    @property (strong, nonatomic) NSArray *food;
    @property (strong, nonatomic) FoodViewCell *foodViewCell;
    @property (nonatomic, strong) DataAccessStore* dataAccessStore;

@end

@implementation FoodDataSource

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
    FoodViewCell *cell = [self sightViewCellFromTable:tableView];
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

    FoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier];
    FoodViewModel *sight = [self.food objectAtIndex:(NSUInteger) [indexPath section]];
    self.sightConfigure(cell, sight);

    return cell;

}


- (FoodViewCell *)sightViewCellFromTable:(UITableView *) tableView {
    if (!self.foodViewCell) {
        self.foodViewCell = [tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier];
    }
    return self.foodViewCell;
}

- (FoodViewModel *)sightForIndexPath:(NSIndexPath *)indexPath {
    return [[self food] objectAtIndex:(NSUInteger) [indexPath section]];
}
@end
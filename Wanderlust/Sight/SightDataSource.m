#import "SightDataSource.h"
#import "DataAccessStore.h"

@interface SightDataSource ()

    @property (strong, nonatomic) NSArray *sights;
    @property (strong, nonatomic) SightViewCell *sightViewCell;
    @property (nonatomic, strong) DataAccessStore* dataAccessStore;

@end

@implementation SightDataSource

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
    SightViewCell *cell = [self sightViewCellFromTable:tableView];
    return [cell height];
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

    SightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SightCellIdentifier];
    SightViewModel *sight = [self.sights objectAtIndex:(NSUInteger) [indexPath row]];
    self.sightConfigure(cell, sight);

    return cell;

}


- (SightViewCell *)sightViewCellFromTable:(UITableView *) tableView {
    if (!self.sightViewCell) {
        self.sightViewCell = [tableView dequeueReusableCellWithIdentifier:SightCellIdentifier];
    }
    return self.sightViewCell;
}

@end
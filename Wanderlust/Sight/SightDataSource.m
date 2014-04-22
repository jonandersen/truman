#import "SightDataSource.h"

@interface SightDataSource ()

    @property (strong, nonatomic) NSArray *sights;

@end

@implementation SightDataSource


- (instancetype) initWithSights:(NSArray *)sights{
    if (self  = [super init]) {
        self.sights = sights;
    }
    return self;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sights count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SightCellIdentifier];
    SightViewModel *sight = [self.sights objectAtIndex:(NSUInteger) [indexPath row]];
    self.sightConfigure(cell, sight);

    return cell;

}

@end
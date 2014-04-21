#import "SightDataSource.h"
#import "BannerTableViewCell.h"

@interface SightDataSource ()

@property (nonatomic, copy) BannerTableViewCellConfigureBlock bannerCellConfigure;

@end

@implementation SightDataSource

- (id)init {
    return nil;
}

- (instancetype) initWithConfigure:(BannerTableViewCellConfigureBlock)bannerCellConfigure{
    self = [super init];
    if (self) {
        self.bannerCellConfigure = [bannerCellConfigure copy];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BannerCell"];
    self.bannerCellConfigure(cell, @"url");

    return cell;

}

@end
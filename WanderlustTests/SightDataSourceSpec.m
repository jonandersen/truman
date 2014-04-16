#import <XCTest/XCTest.h>
#import "SightDataSource.h"

#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

SpecBegin(SightDataSource)

describe(@"SightDataSource ", ^{
    __block SightDataSource *sut;
    __block UITableView *tableView;
    __block BannerTableViewCell *cell;

    beforeEach(^{
        sut = [[SightDataSource alloc] initWithConfigure:^(BannerTableViewCell *bannerTableViewCell, NSString *url) {
            [bannerTableViewCell setUrl:url];
        }];
        tableView = mock([UITableView class]);
        cell = mock([BannerTableViewCell class]);

    });


    describe(@"numberOfRowsInSection", ^{
        it(@"should have 3 cells", ^{
            [ sut tableView:nil numberOfRowsInSection:0];
            NSInteger rows = [sut tableView:tableView numberOfRowsInSection:0];
            expect(rows).to.equal(3);
        });

    });


    describe(@"cellForRowAtIndexPath", ^{

        it(@"should return a Banner Cell on position 0", ^{
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
            [given([tableView dequeueReusableCellWithIdentifier:@"BannerCell"])willReturn:cell];
            UITableViewCell *result = [sut tableView:tableView cellForRowAtIndexPath:index];
            expect(result).to.beKindOf([BannerTableViewCell class]);

        });

        it(@"should configure the Banner Cell", ^{
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
            [given([tableView dequeueReusableCellWithIdentifier:@"BannerCell"]) willReturn:cell];
            BannerTableViewCell *result = (BannerTableViewCell *) [sut tableView:tableView cellForRowAtIndexPath:index];
           [verify(result) setUrl:@"url"];
        });
    });


});

SpecEnd
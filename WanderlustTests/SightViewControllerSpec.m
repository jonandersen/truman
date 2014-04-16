#import <XCTest/XCTest.h>
#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

#import "SightViewController.h"
#import "Sight.h"
#import "BannerTableViewCell.h"

SpecBegin(SightViewController)

describe(@"SightViewController", ^{
    __block SightViewController *sut;
    __block Sight *mockSight;

    beforeEach(^{
        mockSight = mock([Sight class]);
        [given([mockSight title]) willReturn:@"Konigsee"];
        [given([mockSight valueForKey:@"title"]) willReturn:@"Konigsee"];
        [given([mockSight valueForKeyPath:@"title"]) willReturn:@"Konigsee"];
        sut = [[SightViewController alloc] initWithSight:mockSight];
        [sut viewDidLoad];
    });

    describe(@"navigation title", ^{

        it(@"should be set to model", ^{
            expect(sut.title).to.equal(@"Konigsee");

        });
    });

    describe(@"table view", ^{
        it(@"should have a table view", ^{
            expect(sut.tableView).toNot.beNil;
        });

        it(@"should have a data source", ^{
            expect(sut.tableView.dataSource).toNot.beNil;
        });
    });

});

SpecEnd
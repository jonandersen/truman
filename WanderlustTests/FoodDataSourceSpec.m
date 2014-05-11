#import <XCTest/XCTest.h>
#import "FoodDataSource.h"

#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"
#import "DataAccessStore.h"

SpecBegin(SightDataSource)

describe(@"FoodDataSource ", ^{
    __block FoodDataSource *sut;
    __block UITableView *tableView;
    __block FoodViewCell *cell;
    __block BOOL configuredCell;
    __block FoodViewModel *viewModelFromBlock;
    __block NSArray* mockSights;
    __block DataAccessStore* mockDataAccessStore;

    beforeEach(^{
        mockSights = mock([NSArray class]);
        tableView = mock([UITableView class]);
        cell = mock([FoodViewCell class]);
        mockDataAccessStore = mock([DataAccessStore class]);

        //Mock out the sights
        [given([mockDataAccessStore sightViewModels]) willReturn:mockSights];


        //System under test
        sut = [[FoodDataSource alloc] initWithStore:mockDataAccessStore];


        //Cell configuration
        configuredCell = NO;
        sut.sightConfigure = ^(FoodViewCell *bannerTableViewCell, FoodViewModel *viewModel) {
            configuredCell = YES;
            viewModelFromBlock = viewModel;
        };

    });

    it(@"should not allow creation without a store", ^{
        expect([[FoodDataSource alloc] init]).to.beNil();
    });

    it(@"should conform to UITableViewDataSource", ^{
        expect(sut).to.conformTo(@protocol(UITableViewDataSource));
    });

    it(@"should conform to UITableViewDelegate", ^{
        expect(sut).to.conformTo(@protocol(UITableViewDelegate));
    });

    it(@"should have a SightConfigureBlock", ^{
        expect(sut.sightConfigure).toNot.beNil();
    });


    describe(@"numberOfSectionsInTableView", ^{
        it(@"should have as many as sights", ^{
            [given([mockSights count]) willReturn:[NSNumber numberWithInt:2]];
            NSInteger rows = [sut numberOfSectionsInTableView:tableView];
            expect(rows).to.equal([mockSights count]);
        });
    });

    describe(@"height calcuation", ^{
        it(@"should use the height for the cell", ^{
            [given([tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier]) willReturn:cell];
            [sut tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [verify(cell) height];
        });
    });

    describe(@"data access", ^{
        it(@"should ask DataAccessStore for Sights", ^{
            [verify(mockDataAccessStore) sightViewModels];
        });
    });

    describe(@"sight for indexPath", ^{
        it(@"should return a sight for the indexpath", ^{
            FoodViewModel *sightViewModel = mock([FoodViewModel class]);
            [given([mockSights objectAtIndex:2]) willReturn:sightViewModel];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
            expect([sut sightForIndexPath:indexPath]).to.equal(sightViewModel);
        });
    });


    describe(@"cellForRowAtIndexPath", ^{
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];

        it(@"should return a Sight Cell on position 0", ^{
            [given([tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier])willReturn:cell];
            UITableViewCell *result = [sut tableView:tableView cellForRowAtIndexPath:index];
            expect(result).to.beKindOf([FoodViewCell class]);

        });

        it(@"should configure the Sight Cell", ^{

            [given([tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier]) willReturn:cell];
            [sut tableView:tableView cellForRowAtIndexPath:index];
            expect(configuredCell).to.beTruthy();
        });

        it(@"should provide a sight in the configure block", ^{
            FoodViewModel *viewModel = mock([FoodViewModel class]);
            [given([mockSights objectAtIndex:0]) willReturn:viewModel];

            [sut tableView:tableView cellForRowAtIndexPath:index];

            expect(viewModelFromBlock).to.equal(viewModel);
        });

        it(@"should provide a sight for the section index", ^{
            FoodViewModel *viewModel = mock([FoodViewModel class]);
            [given([mockSights objectAtIndex:1]) willReturn:viewModel];

            [sut tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];

            expect(viewModelFromBlock).to.equal(viewModel);
        });
    });


});

SpecEnd
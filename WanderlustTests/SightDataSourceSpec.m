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
    __block SightViewCell *cell;
    __block BOOL configuredCell;
    __block SightViewModel *viewModelFromBlock;
    __block NSArray* mockSights;

    beforeEach(^{
        mockSights = mock([NSArray class]);
        sut = [[SightDataSource alloc] initWithSights:mockSights];
        tableView = mock([UITableView class]);
        cell = mock([SightViewCell class]);

        //Cell configuration
        configuredCell = NO;
        sut.sightConfigure = ^(SightViewCell *bannerTableViewCell, SightViewModel *viewModel) {
            configuredCell = YES;
            viewModelFromBlock = viewModel;
        };

    });

    it(@"should conform to UITableViewDataSource", ^{
        expect(sut).to.conformTo(@protocol(UITableViewDataSource));
    });

    it(@"should conform to UITableViewDelegate", ^{
        expect(sut).to.conformTo(@protocol(UITableViewDelegate));
    });

//    it(@"should have a SightConfigureBlock", ^{
//        expect(sut.sights).toNot.beNil;
//    });


    describe(@"numberOfSectionsInTableView", ^{
        it(@"should have as many as sights", ^{
            [given([mockSights count]) willReturn:
            [NSNumber numberWithInt:2]];
            NSInteger rows = [sut numberOfSectionsInTableView:tableView];
            expect(rows).to.equal([mockSights count]);
        });
    });

    describe(@"height calcuation", ^{
        it(@"should use the height for the cell", ^{

            [given([tableView dequeueReusableCellWithIdentifier:SightCellIdentifier]) willReturn:cell];
            [sut tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [verify(cell) height];
        });


    });


    describe(@"cellForRowAtIndexPath", ^{
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];

        it(@"should return a Sight Cell on position 0", ^{
            [given([tableView dequeueReusableCellWithIdentifier:SightCellIdentifier])willReturn:cell];
            UITableViewCell *result = [sut tableView:tableView cellForRowAtIndexPath:index];
            expect(result).to.beKindOf([SightViewCell class]);

        });

        it(@"should configure the Sight Cell", ^{

            [given([tableView dequeueReusableCellWithIdentifier:SightCellIdentifier]) willReturn:cell];
            [sut tableView:tableView cellForRowAtIndexPath:index];
            expect(configuredCell).to.beTruthy;
        });

        it(@"should provide a sight in the configure block", ^{
            SightViewModel *viewModel = mock([SightViewModel class]);
            [given([mockSights objectAtIndex:0]) willReturn:viewModel];

            [given([tableView dequeueReusableCellWithIdentifier:@"SightCell"]) willReturn:cell];

            [sut tableView:tableView cellForRowAtIndexPath:index];


            expect(viewModelFromBlock).to.equal(viewModel);
        });
    });


});

SpecEnd
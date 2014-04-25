#import <XCTest/XCTest.h>
#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

#import "HomeViewController.h"
#import "SightViewCell.h"
#import "UITableViewMock.h"
#import "SightDataSource.h"
#import "SightViewController.h"
#import "ImageService.h"
#import "Registry.h"
#import "SwipeViewDataSource.h"

SpecBegin(HomeViewControllerSpec)

describe(@"HomeViewController", ^{
    __block HomeViewController *sut;
    __block SightViewModel *mockSight;
    __block SightDataSource *mockDataSource;
    __block Registry *mockRegistry;

    beforeEach(^{
        mockSight = mock([SightViewModel class]);
        mockDataSource = mock([SightDataSource class]);
        mockRegistry = mock([Registry class]);

        [given([mockSight valueForKeyPath:@"title"]) willReturn:@"Konigsee"];

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        sut = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        sut.sight = mockSight;
        sut.sightDataSource = mockDataSource;
        sut.registry = mockRegistry;
        [sut view];
    });

    it(@"should be instantiated from the storyboard", ^{
        expect(sut).toNot.beNil();
        expect(sut).to.beInstanceOf([HomeViewController class]);
    });

    it(@"should have a SightDataSource property", ^{
        expect(sut.sightDataSource).toNot.beNil();
    });

    it(@"should have an ImageService property", ^{
        sut.imageService = mock([ImageService class]);
        expect(sut.imageService).toNot.beNil();
    });

    it(@"should have a registry property", ^{
        expect(sut.registry).toNot.beNil();
    });



    describe(@"navigation title", ^{

        it(@"should be set to model", ^{
            expect(sut.title).to.equal(@"Konigsee");

        });

    });

    describe(@"table view", ^{
        __block UITableViewMock *mockTableView;

        beforeEach(^{
            mockTableView = [[UITableViewMock alloc] init];
            [sut setTableView:mockTableView];
            [sut viewDidLoad];

        });

        it(@"should have a table view", ^{
            expect(sut.tableView).to.equal(mockTableView);
        });

        it(@"should have table view delegate set", ^{
            expect([mockTableView delegateSpy]).to.equal(mockDataSource);
        });

        it(@"should have a data source", ^{
            expect([mockTableView dataSourceSpy]).to.equal(mockDataSource);
        });
    });

    describe(@"Configure SightViewCell", ^{
        __block SightViewCell *cellMock;
        __block SightViewModel *viewModel;
        __block MKTArgumentCaptor *argument;
        __block BannerTableViewCellConfigureBlock block;

        beforeEach(^{
            argument = [[MKTArgumentCaptor alloc] init];
            cellMock = mock([SightViewCell class]);
            viewModel = mock([SightViewModel class]);
            [sut.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [verify(mockDataSource) setSightConfigure:[argument capture]];
            block = [argument value];
        });

        it(@"should set title", ^{
            block(cellMock, viewModel);
            [verify(viewModel) title];
            [verify(cellMock) titleLabel];

        });


        it(@"should set image", ^{
            UIImageView *mockImageView = mock([UIImageView class]);
            [given(cellMock.sightImageView) willReturn:mockImageView];
            block(cellMock, viewModel);
            [verify(viewModel) picture];
            [verify(mockImageView) setImage:[argument capture]];
        });
    });


    describe(@"navigation segue", ^{
        __block SightViewController *sightViewController;
        __block UIStoryboardSegue *segue;

        beforeEach(^{
            sightViewController = mock([SightViewController class]);
            segue = [UIStoryboardSegue segueWithIdentifier:@"SightViewControllerPush" source:sut destination:sightViewController performHandler:^{
                // do nothing here
            }];
        });

        it(@"should set imageservice to new view controller", ^{
            ImageService *imageService = mock([ImageService class]);
            sut.imageService = imageService;


            [sut prepareForSegue:segue sender:self];

            [verify(sightViewController) setImageService:imageService];

        });

        it(@"shold set the SwipeViewDataSource", ^{
            SwipeViewDataSource *mockSwipeViewDataSource = mock([SwipeViewDataSource class]);
            [given([mockRegistry swipeViewDataSource]) willReturn:mockSwipeViewDataSource];


            [sut prepareForSegue:segue sender:self];

            [verify(sightViewController) setSwipeViewDataSource:mockSwipeViewDataSource];


        });

        it(@"should navigate to new view controller when selecting sight", ^{
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
            SightViewModel *sightViewModel = mock([SightViewModel class]);
            [given([mockDataSource sightForIndexPath:index]) willReturn:sightViewModel];

            [sut.tableView selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];

            [sut prepareForSegue:segue sender:self];

            [verify(sightViewController) setSight:sightViewModel];

        });
    });





});

SpecEnd
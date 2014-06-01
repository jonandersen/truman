#import <XCTest/XCTest.h>
#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

#import "HomeViewController.h"
#import "ImageViewCell.h"
#import "UITableViewMock.h"
#import "MessageDataSource.h"
#import "MessageViewController.h"
#import "ImageService.h"
#import "Registry.h"
#import "SwipeViewDataSource.h"
#import "MessageViewCell.h"

SpecBegin(HomeViewControllerSpec)

describe(@"HomeViewController", ^{
    __block HomeViewController *sut;
    __block MessageViewModel *mockVM;
    __block MessageDataSource *mockDataSource;
    __block Registry *mockRegistry;

    beforeEach(^{
        mockVM = mock([MessageViewModel class]);
        mockDataSource = mock([MessageDataSource class]);
        mockRegistry = mock([Registry class]);

        [given([mockVM valueForKeyPath:@"poster"]) willReturn:@"Poster"];

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        sut = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        sut.foodViewModel = mockVM;
        sut.messageDataSource = mockDataSource;
        sut.registry = mockRegistry;
        [sut view];
    });

    it(@"should be instantiated from the storyboard", ^{
        expect(sut).toNot.beNil();
        expect(sut).to.beInstanceOf([HomeViewController class]);
    });

    it(@"should have a MessageDataSource property", ^{
        expect(sut.messageDataSource).toNot.beNil();
    });

    it(@"should have an ImageService property", ^{
        sut.imageService = mock([ImageService class]);
        expect(sut.imageService).toNot.beNil();
    });

    it(@"should have a registry property", ^{
        expect(sut.registry).toNot.beNil();
    });



    describe(@"navigation name", ^{

        it(@"should be set to model", ^{
            expect(sut.title).to.equal(@"Poster");

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

    describe(@"Configure ImageViewCell", ^{
        __block MessageViewCell *cellMock;
        __block MessageViewModel *viewModel;
        __block MKTArgumentCaptor *argument;
        __block MessageTableViewCellConfigureBlock block;

        beforeEach(^{
            argument = [[MKTArgumentCaptor alloc] init];
            cellMock = mock([MessageViewCell class]);
            viewModel = mock([MessageViewModel class]);
            [sut.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [verify(mockDataSource) setSightConfigure:[argument capture]];
            block = [argument value];
        });

        it(@"should set message", ^{
            block(cellMock, viewModel);
            [verify(viewModel) message];
            [verify(cellMock) textField];

        });
    });


    describe(@"navigation segue", ^{
        __block MessageViewController *sightViewController;
        __block UIStoryboardSegue *segue;

        beforeEach(^{
            sightViewController = mock([MessageViewController class]);
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

        it(@"should navigate to new view controller when selecting messageViewModel", ^{
            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
            MessageViewModel *sightViewModel = mock([MessageViewModel class]);
            [given([mockDataSource sightForIndexPath:index]) willReturn:sightViewModel];

            [sut.tableView selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];

            [sut prepareForSegue:segue sender:self];

            [verify(sightViewController) setMessageViewModel:sightViewModel];

        });
    });





});

SpecEnd
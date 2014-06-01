#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "MessageViewController.h"
#import "MessageViewModel.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"

SpecBegin(MessageViewControllerSpec)

describe(@"SightViewControllerSpec", ^{
    __block MessageViewController *sut;
    __block MessageViewModel *mockVM;
    __block ImageService *mockImageService;
    __block SwipeViewDataSource *mockSwipeViewDataSource;

    beforeEach(^{
        mockVM = mock([MessageViewModel class]);
        mockImageService = mock([ImageService  class]);
        mockSwipeViewDataSource = mock([SwipeViewDataSource class]);

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        sut = [storyboard instantiateViewControllerWithIdentifier:@"MessageViewController"];

        sut.messageViewModel = mockVM;
        sut.imageService = mockImageService;
        sut.swipeViewDataSource = mockSwipeViewDataSource;

        [sut view];

    });
    
    it(@"should have a imageservice property", ^{
        expect(sut.imageService).toNot.beNil();
    });

    it(@"should have a messageViewModel set", ^{
        expect(sut.messageViewModel).toNot.beNil();
    });

    it(@"should have a swipeview", ^{
        expect(sut.swipeView).toNot.beNil();
        expect(sut.swipeView).to.beInstanceOf([SwipeView class]);
    });

    it(@"should set a DataSource for swipeview", ^{
        expect(sut.swipeView.delegate).toNot.beNil();
    });

    it(@"should have a location label", ^{
        expect(sut.locationLabel).toNot.beNil();
    });

    it(@"should set the message label to the messageViewModel", ^{
        [given(mockVM.message) willReturn:@"Message"];
        [given(mockVM.poster) willReturn:@"Poster"];

        [sut viewDidLoad];

        expect(sut.locationLabel.text).to.equal(@"Message by Poster");
    });



});

SpecEnd
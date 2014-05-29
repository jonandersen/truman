#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "FoodViewController.h"
#import "FoodViewModel.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"

SpecBegin(SightViewControllerSpec)

describe(@"SightViewControllerSpec", ^{
    __block FoodViewController *sut;
    __block FoodViewModel *mockVM;
    __block ImageService *mockImageService;
    __block SwipeViewDataSource *mockSwipeViewDataSource;

    beforeEach(^{
        mockVM = mock([FoodViewModel class]);
        mockImageService = mock([ImageService  class]);
        mockSwipeViewDataSource = mock([SwipeViewDataSource class]);

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        sut = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewController"];

        sut.sight = mockVM;
        sut.imageService = mockImageService;
        sut.swipeViewDataSource = mockSwipeViewDataSource;

        [sut view];

    });
    
    it(@"should have a imageservice property", ^{
        expect(sut.imageService).toNot.beNil();
    });

    it(@"should have a sight set", ^{
        expect(sut.sight).toNot.beNil();
    });

    it(@"should have a swipeview", ^{
        expect(sut.swipeView).toNot.beNil();
        expect(sut.swipeView).to.beInstanceOf([SwipeView class]);
    });

    it(@"should set a DataSource for swipeview", ^{
        expect(sut.swipeView.delegate).toNot.beNil();
    });

//    it(@"should set image view to sight image", ^{
//        UIImage *mockImage = mock([UIImage class]);
//        NSURL *url = [NSURL URLWithString:@"testimage.jpg"];
//        [given([mockVM picture]) willReturn:url];
//
//        [given([mockImageService imageForUrl:url]) willReturn:mockImage];
//
//        [sut viewDidLoad];
//        expect([sut.sightUIImageView image]).to.equal(mockImage);
//    });

    it(@"should have a location label", ^{
        expect(sut.locationLabel).toNot.beNil();
    });

    it(@"should set the locaiton label to the sight", ^{
        [given(mockVM.country) willReturn:@"Germany"];
        [given(mockVM.region) willReturn:@"Bavaria"];

        [sut viewDidLoad];

        expect(sut.locationLabel.text).to.equal(@"Bavaria/Germany");
    });



});

SpecEnd
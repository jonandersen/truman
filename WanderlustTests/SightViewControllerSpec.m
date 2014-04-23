#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "SightViewController.h"
#import "SightViewModel.h"
#import "ImageService.h"

SpecBegin(SightViewControllerSpec)

describe(@"SightViewControllerSpec", ^{
    __block SightViewController *sut;
    __block SightViewModel *mockSightViewModel;
    __block ImageService *mockImageService;

    beforeEach(^{
        mockSightViewModel = mock([SightViewModel class]);
        mockImageService = mock([ImageService  class]);

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        sut = [storyboard instantiateViewControllerWithIdentifier:@"SightViewController"];

        sut.sight = mockSightViewModel;
        sut.imageService = mockImageService;

        [sut view];

    });
    
    it(@"should have a imageservice property", ^{
        expect(sut.imageService).toNot.beNil();
    });

    it(@"should have a sight set", ^{
        expect(sut.sight).toNot.beNil();
    });

    it(@"should have a imageview", ^{
        expect(sut.sightUIImageView).toNot.beNil();
    });

    it(@"should set image view to sight image", ^{
        UIImage *mockImage = mock([UIImage class]);
        NSURL *url = [NSURL URLWithString:@"testimage.jpg"];
        [given([mockSightViewModel picture]) willReturn:url];

        [given([mockImageService imageForUrl:url]) willReturn:mockImage];

        [sut viewDidLoad];
        expect([sut.sightUIImageView image]).to.equal(mockImage);
    });



});

SpecEnd
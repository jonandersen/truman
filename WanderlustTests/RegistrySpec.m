#import <XCTest/XCTest.h>


#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "HomeViewController.h"
#import "Registry.h"

SpecBegin(RegistrySpec)

describe(@"RegistrySpec", ^{
    __block Registry *sut;

    beforeEach(^{
        sut = [[Registry alloc] init];
    });

    it(@"should provide a FoodDataSource", ^{
        expect([sut sightDataSource]).toNot.beNil();
    });

    it(@"should provide a ImageService", ^{
        expect([sut imageService]).toNot.beNil();
    });

    it(@"should provide a SwipeViewDataSource", ^{
        expect([sut swipeViewDataSource]).toNot.beNil();
    });

});

SpecEnd
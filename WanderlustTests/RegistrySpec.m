#import <XCTest/XCTest.h>


#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "SightViewController.h"
#import "Registry.h"

SpecBegin(RegistrySpec)

describe(@"RegistrySpec", ^{
    __block Registry *sut;

    beforeEach(^{
        sut = [[Registry alloc] init];
    });

    it(@"should provide a SightDataSource", ^{
        expect([sut sightDataSource]).toNot.beNil();
    });



});

SpecEnd
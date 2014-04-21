#import <XCTest/XCTest.h>
#import "SightViewModel.h"

#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

SpecBegin(SightViewModelSpec)

describe(@"SightViewModel should", ^{
    __block SightViewModel *sut;

    beforeEach(^{
       sut = [SightViewModel new];
    });

    it(@"have a title", ^{
        sut.title = @"title";
        expect(sut.title).to.equal(@"title");
    });

    it(@"have a continent", ^{
       sut.continent = @"Europe";
       expect(sut.continent).to.equal(@"Europe");
    });

    it(@"have a country", ^{
        sut.country = @"Sweden";
        expect(sut.country).to.equal(@"Sweden");
    });

    it(@"have a region", ^{
        sut.region = @"Scania";
        expect(sut.region).to.equal(@"Scania");
    });

    it(@"have a picture", ^{
        sut.picture = [NSURL URLWithString:@"www.image.com"];
        expect([sut.picture absoluteString]).to.equal(@"www.image.com");
    });

});


SpecEnd
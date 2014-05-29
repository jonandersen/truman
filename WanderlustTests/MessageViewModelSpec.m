#import <XCTest/XCTest.h>
#import "MessageViewModel.h"

#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND

#import "Expecta.h"

SpecBegin(MessageViewModelSpec)

describe(@"MessageViewModel should", ^{
    __block MessageViewModel *sut;

    beforeEach(^{
       sut = [MessageViewModel new];
    });

    it(@"have a name", ^{
        sut.name = @"name";
        expect(sut.name).to.equal(@"name");
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
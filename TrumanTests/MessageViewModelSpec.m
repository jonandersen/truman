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

    it(@"have a message", ^{
        sut.message = @"message";
        expect(sut.message).to.equal(@"message");
    });

    it(@"have a poster", ^{
       sut.poster = @"poster";
       expect(sut.poster).to.equal(@"poster");
    });
});


SpecEnd
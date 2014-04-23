#import <XCTest/XCTest.h>


#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "DataAccessStore.h"
#import "SightViewModel.h"

SpecBegin(DataAccessStoreSpec)

describe(@"DataAccessStoreSpec", ^{
    __block DataAccessStore *sut;

    beforeEach(^{
        sut = [[DataAccessStore alloc] init];
    });

    it(@"should return 5 SightViewModels", ^{
        expect([[sut sightViewModels] count]).to.equal(5);
    });

    it(@"should return of type SightViewModels", ^{
        NSArray *viewModels = [sut sightViewModels];
        for(int i = 0; i < [viewModels count]; i ++){
            expect([viewModels objectAtIndex:i]).to.beInstanceOf([SightViewModel class]);
        }
    });





});

SpecEnd
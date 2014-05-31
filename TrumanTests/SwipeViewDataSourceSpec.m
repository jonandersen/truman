#import <XCTest/XCTest.h>

#import "Specta.h"

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>
#import <SwipeView/SwipeView.h>

#define EXP_SHORTHAND

#import "Expecta.h"
#import "SwipeViewDataSource.h"

SpecBegin(SwipeViewDataSourceSpec)

describe(@"SwipeViewDataSource", ^{
    __block SwipeViewDataSource *sut;
    __block NSArray *images;
    __block BOOL calledConfigureBlock;
    __block UIView *mockView;

    beforeEach(^{
        images = mock([NSArray class]);
        mockView = mock([UIView class]);
        sut = [[SwipeViewDataSource alloc] initWithImages:images];
        calledConfigureBlock = NO;
        sut.swipeViewViewConfigBlock = ^UIView *(UIView *view, id item){
            calledConfigureBlock = YES;
            return mockView;
        };
    });

    it(@"should implement SwipeView Datasource Protocol", ^{
        expect(sut).to.conformTo(@protocol(SwipeViewDataSource));
    });

    it(@"should implement SwipeView Delegate Protocol", ^{
        expect(sut).to.conformTo(@protocol(SwipeViewDelegate));
    });

    it(@"should not allow creation without items", ^{
        expect([[SwipeViewDataSource alloc] init]).to.beNil();
    });

    it(@"should return 3 for numberOfItemsInSwipeView", ^{
        [given(images.count) willReturn:@3];
        expect([sut numberOfItemsInSwipeView:nil]).to.equal(3);
    });

    it(@"should return 0 if array is empty in numberOfItemsInSwipeView", ^{
        [given(images.count) willReturn:@0];
        expect([sut numberOfItemsInSwipeView:nil]).to.equal(0);
    });

    it(@"should return 0 if array is nil in numberOfItemsInSwipeView", ^{
        sut = [[SwipeViewDataSource alloc] initWithImages:nil];
        expect([sut numberOfItemsInSwipeView:nil]).to.equal(0);
    });

    it(@"should call config view block with item from array viewForItemAtIndex", ^{
        SwipeView *mockSwipeView = mock([SwipeView class]);
        [sut swipeView:mockSwipeView viewForItemAtIndex:0 reusingView:nil];
        expect(calledConfigureBlock).to.beTruthy();
    });

    it(@"should provided the correct item for the configure block", ^{
        SwipeView *mockSwipeView = mock([SwipeView class]);
        [sut swipeView:mockSwipeView viewForItemAtIndex:2 reusingView:nil];
        [verify(images) objectAtIndex:2];
    });

    it(@"should return the view from the configure block", ^{
        SwipeView *mockSwipeView = mock([SwipeView class]);
        UIView *result = [sut swipeView:mockSwipeView viewForItemAtIndex:0 reusingView:nil];
        expect(result).to.equal(mockView);
    });


});


SpecEnd
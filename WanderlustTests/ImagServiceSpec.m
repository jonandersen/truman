#import <XCTest/XCTest.h>


#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ImageService.h"

SpecBegin(ImageServiceSpec)

describe(@"ImageServiceSpec", ^{
    __block ImageService *sut;

    beforeEach(^{
        sut = [[ImageService alloc] init];
    });


    it(@"should return an image for a url", ^{
        NSURL *url = [NSURL URLWithString:@"testimage.jpg"];
        expect([sut imageForUrl:url]).toNot.beNil();
    });


});

SpecEnd
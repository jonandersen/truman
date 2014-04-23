#import <XCTest/XCTest.h>

#import "Specta.h"


#define EXP_SHORTHAND

#import "Expecta.h"
#import "SightViewCell.h"
#import "HomeViewController.h"

SpecBegin(SightViewCellSpec)

describe(@"SightViewCell", ^{
    __block SightViewCell *sut;

    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        HomeViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [vc view];
        sut =  [vc.tableView dequeueReusableCellWithIdentifier:SightCellIdentifier];
    });

    it(@"should have an image view", ^{
        expect(sut.sightImageView).toNot.beNil();
    });

    it(@"should have a location title", ^{
        expect(sut.titleLabel).toNot.beNil();
    });

    it(@"should have height same as its frame", ^{
        expect([sut height]).to.equal(sut.frame.size.height);
    });

});

SpecEnd
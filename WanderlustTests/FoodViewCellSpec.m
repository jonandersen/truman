#import <XCTest/XCTest.h>

#import "Specta.h"


#define EXP_SHORTHAND

#import "Expecta.h"
#import "FoodViewCell.h"
#import "HomeViewController.h"

SpecBegin(SightViewCellSpec)

describe(@"FoodViewCell", ^{
    __block FoodViewCell *sut;

    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        HomeViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [vc view];
        sut = [vc.tableView dequeueReusableCellWithIdentifier:FoodCellIdentifier];
    });

    it(@"should have an image view", ^{
        expect(sut.sightImageView).toNot.beNil();
    });

    it(@"should have a location name", ^{
        expect(sut.titleLabel).toNot.beNil();
    });

    it(@"should have height same as its frame", ^{
        expect([sut height]).to.equal(sut.frame.size.height);
    });

});

SpecEnd
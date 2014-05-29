#import <XCTest/XCTest.h>


#import "Specta.h"


#define EXP_SHORTHAND
#import "Expecta.h"

#import "AppDelegate.h"
#import "HomeViewController.h"

SpecBegin(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *sut;

    beforeEach(^{
        sut = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        [sut application:nil didFinishLaunchingWithOptions:nil];

    });

    it(@"should have a window", ^{
       expect(sut.window).toNot.beNil();
    });

    it(@"should have a navigation view controller", ^{
        expect(sut.window.rootViewController).to.beInstanceOf([UINavigationController class]);
    });

    describe(@"root view controller", ^{
        __block HomeViewController* homeViewController;
        beforeEach(^{
            UINavigationController* vc = (UINavigationController*)sut.window.rootViewController;
            homeViewController = (HomeViewController *)vc.topViewController;
        });

        it(@"should have sight view controller as first view", ^{
            UINavigationController* vc = (UINavigationController*)sut.window.rootViewController;
            expect(vc.topViewController).to.beInstanceOf([HomeViewController class]);
        });

        it(@"should have a registry set", ^{
            expect(homeViewController.registry).toNot.beNil();
        });

        it(@"should have a datasource set", ^{
            expect(homeViewController.foodDataSource).toNot.beNil();
        });

        it(@"should have imageservice set", ^{
            expect(homeViewController.imageService).toNot.beNil();
        });
    });




});

SpecEnd
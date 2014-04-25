#import <Foundation/Foundation.h>

@class SightDataSource;
@class ImageService;
@class SwipeViewDataSource;


@interface Registry : NSObject

-(SightDataSource *) sightDataSource;
-(ImageService *) imageService;
-(SwipeViewDataSource *) swipeViewDataSource;

@end
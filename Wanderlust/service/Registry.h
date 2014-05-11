#import <Foundation/Foundation.h>

@class FoodDataSource;
@class ImageService;
@class SwipeViewDataSource;


@interface Registry : NSObject

-(FoodDataSource *) sightDataSource;
-(ImageService *) imageService;
-(SwipeViewDataSource *) swipeViewDataSource;

@end
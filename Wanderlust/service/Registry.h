#import <Foundation/Foundation.h>

@class MessageDataSource;
@class ImageService;
@class SwipeViewDataSource;


@interface Registry : NSObject

-(MessageDataSource *) sightDataSource;
-(ImageService *) imageService;
-(SwipeViewDataSource *) swipeViewDataSource;

@end
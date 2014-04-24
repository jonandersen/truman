#import <Foundation/Foundation.h>

@class SightDataSource;
@class ImageService;


@interface Registry : NSObject

-(SightDataSource *) sightDataSource;
-(ImageService *) imageService;

@end
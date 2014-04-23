#import "ImageService.h"

@implementation ImageService {

}
- (UIImage *)imageForUrl:(NSURL *)url {
    return [UIImage imageNamed:[url absoluteString]];
}
@end
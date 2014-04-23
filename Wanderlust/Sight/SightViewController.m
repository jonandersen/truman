#import "SightViewController.h"
#import "SightViewModel.h"
#import "ImageService.h"

@implementation SightViewController {

}

- (void)viewDidLoad {
    UIImage *image = [self.imageService imageForUrl:self.sight.picture];
    self.sightUIImageView.image = image;
}

- (void) dealloc{
    self.sight = nil;
    self.imageService = nil;
}
@end
#import <SwipeView/SwipeView.h>
#import "MessageViewController.h"
#import "MessageViewModel.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"

@implementation MessageViewController {

}

- (void)viewDidLoad {
    self.swipeView.delegate = self.swipeViewDataSource;
    //UIImage *image = [self.imageService imageForUrl:self.sight.picture];
    //self.sightUIImageView.image = image;
    NSString *locationText = [NSString stringWithFormat:@"%@/%@", self.sight.region, self.sight.country];
    self.locationLabel.text  = locationText;
}

- (void) dealloc{
    self.sight = nil;
    self.imageService = nil;
    self.swipeViewDataSource = nil;
}
@end
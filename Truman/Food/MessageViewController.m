#import <SwipeView/SwipeView.h>
#import "MessageViewController.h"
#import "MessageViewModel.h"
#import "ImageService.h"
#import "SwipeViewDataSource.h"

@implementation MessageViewController {

}

- (void)viewDidLoad {
    self.swipeView.delegate = self.swipeViewDataSource;
    //UIImage *image = [self.imageService imageForUrl:self.messageViewModel.picture];
    //self.sightUIImageView.image = image;
    NSString *locationText = [NSString stringWithFormat:@"%@ by %@", self.messageViewModel.message, self.messageViewModel.poster];
    self.locationLabel.text  = locationText;
}

- (void) dealloc{
    self.messageViewModel = nil;
    self.imageService = nil;
    self.swipeViewDataSource = nil;
}
@end

#import <UIKit/UIKit.h>

@interface SightViewCell : UITableViewCell

FOUNDATION_EXPORT NSString *const SightCellIdentifier;

@property (weak, nonatomic) IBOutlet UIImageView *sightImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@interface SightViewCell : UITableViewCell

FOUNDATION_EXPORT NSString *const SightCellIdentifier;

@property (weak, nonatomic) IBOutlet UIImageView *sightImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (CGFloat)height;
@end

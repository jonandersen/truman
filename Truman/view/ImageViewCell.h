
@interface ImageViewCell : UITableViewCell

FOUNDATION_EXPORT NSString *const ImageCellIdentifier;

@property (weak, nonatomic) IBOutlet UIImageView *sightImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (CGFloat)height;
@end


@interface FoodViewCell : UITableViewCell

FOUNDATION_EXPORT NSString *const FoodCellIdentifier;

@property (weak, nonatomic) IBOutlet UIImageView *sightImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (CGFloat)height;
@end

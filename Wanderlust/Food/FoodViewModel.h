#import <Foundation/Foundation.h>

@interface FoodViewModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString * continent;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * region;
@property (nonatomic, strong) NSURL * picture;

@end
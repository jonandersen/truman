//
// Created by Jon Andersen on 31/05/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MessageViewCell : UITableViewCell

FOUNDATION_EXPORT NSString *const MessageCellIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIView *container;

- (CGFloat)height;

@end
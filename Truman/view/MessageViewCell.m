//
// Created by Jon Andersen on 31/05/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "MessageViewCell.h"


@implementation MessageViewCell

NSString *const MessageCellIdentifier = @"MessageCell";

-(void)layoutSubviews {
    [super layoutSubviews];
    self.messageLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.messageLabel.frame);
}


- (CGFloat) height {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGSize fittingSize = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return fittingSize.height;
}




@end
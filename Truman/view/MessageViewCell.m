//
// Created by Jon Andersen on 31/05/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "MessageViewCell.h"


@implementation MessageViewCell

NSString *const MessageCellIdentifier = @"MessageCell";

-(void)layoutSubviews {
    [super layoutSubviews];
    self.messageLabel.numberOfLines = 0;
    [self.messageLabel sizeToFit];
    self.container.frame = CGRectMake(10,0,300, self.messageLabel.frame.size.height);
}


- (CGFloat) height {

    self.messageLabel.numberOfLines = 0; // allows label to have as many lines as needed
    [self.messageLabel sizeToFit];
    self.container.frame = self.messageLabel.frame;
    return self.messageLabel.frame.size.height;
}




@end
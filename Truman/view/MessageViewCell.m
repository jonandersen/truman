//
// Created by Jon Andersen on 31/05/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "MessageViewCell.h"


@implementation MessageViewCell

NSString *const MessageCellIdentifier = @"MessageCell";

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat) height {
    return self.frame.size.height;
}


@end
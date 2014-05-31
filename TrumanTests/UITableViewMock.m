//
// Created by Jon Andersen on 22/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import "UITableViewMock.h"


@implementation UITableViewMock {


}
- (id)delegateSpy {
    return [self delegate];
}

- (id)dataSourceSpy {
    return [self dataSource];
}


@end
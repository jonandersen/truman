//
// Created by Jon Andersen on 23/04/14.
// Copyright (c) 2014 Jon Andersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SightViewModel;
@class ImageService;


@interface SightViewController : UIViewController

@property(nonatomic, strong) SightViewModel *sight;
@property (weak, nonatomic) IBOutlet UIImageView *sightUIImageView;

@property(nonatomic, strong) ImageService *imageService;
@end
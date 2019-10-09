//
//  CMASubDogs.m
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMASubDogs.h"

@implementation CMASubDogs

- (instancetype)initWithSubBreed:(NSString *)dogSubBreed dogImage:(NSString *)dogImage
{
    self = [super init];
    if (self)
    {
        _dogSubBreed = dogSubBreed;
        _dogImage = dogImage;
    }
    return self;
}

@end

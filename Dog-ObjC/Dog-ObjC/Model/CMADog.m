//
//  CMADog.m
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMADog.h"

@implementation CMADog

- (instancetype)initWithDogBreed:(NSString *)dogBreed dogSubBreed:(NSArray *)dogSubBreed dogImage:(NSString *)dogImage
{
    self = [super init];
    if (self)
    {
        _dogBreed = dogBreed;
        _dogSubBreed = dogSubBreed;
        _dogImage = dogImage;
    }
    return self;
}

@end

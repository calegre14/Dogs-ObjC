//
//  CMASubDogs.h
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMASubDogs : NSObject

@property(nonatomic,copy,readonly, nullable)NSString * dogSubBreed;
@property(nonatomic,copy, readonly, nullable)NSString * dogImage;

-(instancetype)initWithSubBreed:(NSString *)dogSubBreed
                       dogImage:(NSString *)dogImage;

@end

NS_ASSUME_NONNULL_END

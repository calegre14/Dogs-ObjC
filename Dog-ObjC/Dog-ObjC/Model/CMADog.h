//
//  CMADog.h
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMADog : NSObject

@property(nonatomic,copy,readonly,nonnull)NSString * dogBreed;
@property(nonatomic,copy,readonly, nullable)NSArray * dogSubBreed;
@property(nonatomic,copy, readonly, nonnull)NSString * dogImage;

-(instancetype)initWithDogBreed:(NSString *)dogBreed
                    dogSubBreed:(NSArray *)dogSubBreed
                       dogImage:(NSString *)dogImage;


@end

NS_ASSUME_NONNULL_END

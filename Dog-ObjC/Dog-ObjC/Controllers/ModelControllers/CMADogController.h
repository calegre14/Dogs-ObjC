//
//  CMADogController.h
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMADog.h"
#import "CMASubDogs.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMADogController : NSObject

@property (nonatomic, copy)NSArray<CMADog *>* dogs;

+(instancetype)sharedController;

-(void)fetchDog:(void(^)(BOOL))completion;
-(void)fetchImage:(CMADog *)dog completion:(void(^) (UIImage * nullable))completion;
-(void)fetchSubDogImage:(CMASubDogs *)subDog completion:(void(^) (UIImage * nullable))completion;

@end

NS_ASSUME_NONNULL_END

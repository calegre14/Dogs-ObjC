//
//  CMADogController.m
//  Dog-ObjC
//
//  Created by Christopher Alegre on 10/9/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMADogController.h"
#import "CMADog.h"
#import "CMASubDogs.h"

@implementation CMADogController

static NSString * const kBaseURLString = @"https://dog.ceo/api";
static NSString * const kBreedsNameComponent = @"breeds";
static NSString * const kListAllComponents = @"list/all";

static NSString * const kBreedComponent = @"breed";
static NSString * const kImageRandomComponent = @"images/random";

+ (instancetype)sharedController
{
    static CMADogController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CMADogController new];
    });
    return sharedInstance;
}

- (void)fetchDog:(void (^)(BOOL))completion
{
    NSURL * url = [NSURL URLWithString:kBaseURLString];
    NSURL * breedsURL = [url URLByAppendingPathComponent:kBreedsNameComponent];
    NSURL * finalURL = [breedsURL URLByAppendingPathComponent:kListAllComponents];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Errot parsing JSON %@", error);
            completion(false);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary * topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelJSON)
            {
                NSLog(@"Error parsing JSON %@", error);
                completion(false);
                return;
            }
            NSDictionary * messageDictionary = topLevelJSON[@"message"];
            NSMutableArray * arrayOfBreeds = [NSMutableArray new];
            for (id keyOfWhateverTheFuckYeahWant in messageDictionary)
            {
                NSString * breedName = keyOfWhateverTheFuckYeahWant;
                NSMutableArray * subBreeds = [NSMutableArray new];
                for (NSString * name in messageDictionary[keyOfWhateverTheFuckYeahWant])
                {
                    CMASubDogs * subBreed = [[CMASubDogs alloc] initWithSubBreed:name dogImage:[NSString new]];
                    [subBreeds addObject:subBreed];
                }
                CMADog * newBreed = [[CMADog alloc]initWithDogBreed:breedName dogSubBreed:subBreeds dogImage:[NSString new]];
                [arrayOfBreeds addObject:newBreed];
            }
            completion(true);
        }
    }]resume];
}

-(void)fetchImage:(CMADog *)dog completion:(void (^)(UIImage * nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:kBaseURLString];
    NSURL * breedURL = [imageURL URLByAppendingPathComponent:kBreedComponent];
    NSURL * dogComponent = [breedURL URLByAppendingPathComponent:dog.dogBreed];
    NSURL * finalURL = [dogComponent URLByAppendingPathComponent:kImageRandomComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"No Data found");
            completion(nil);
            return;
        }
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}

-(void)fetchSubDogImage:(CMASubDogs *)subDog completion:(void (^)(UIImage * nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:kBaseURLString];
    NSURL * breedURL = [imageURL URLByAppendingPathComponent:kBreedComponent];
    NSURL * dogComponent = [breedURL URLByAppendingPathComponent:subDog.dogSubBreed];
    NSURL * finalURL = [dogComponent URLByAppendingPathComponent:kImageRandomComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"No Data found");
            completion(nil);
            return;
        }
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}
@end

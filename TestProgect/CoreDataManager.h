//
//  CoreDataManager.h
//  MyCityVoice
//
//  Created by Zakhar on 5/12/17.
//  Copyright © 2017 BalinaSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weather+CoreDataClass.h"
#import "Weather+CoreDataProperties.h"
#import "Weathers.h"

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)sharedInstance;

- (void) saveWeatherWithParams:(NSDate *)date lng:(double) lng lat:(double) lat temperature:(NSString *)temperature imageURL:(NSString *)imageUrl name:(NSString *)name;
- (NSMutableArray *) getWeather;

@end

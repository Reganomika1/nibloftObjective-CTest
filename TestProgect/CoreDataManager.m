//
//  CoreDataManager.m
//  MyCityVoice
//
//  Created by Zakhar on 5/12/17.
//  Copyright © 2017 BalinaSoft. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


+ (instancetype) sharedInstance
{
    static CoreDataManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc] init];
    });
    
    return sharedInstance;
}



#pragma mark - CoreData Methods -

#pragma mark - Core Data Methods

- (void) saveWeatherWithParams:(NSDate *)date lng:(double) lng lat:(double) lat temperature:(NSString *)temperature imageURL:(NSString *)imageUrl name:(NSString *)name
{
    
    Weather *weatherCoreData = [NSEntityDescription insertNewObjectForEntityForName:@"Weather" inManagedObjectContext:self.managedObjectContext];
    
    weatherCoreData.date = date;
    weatherCoreData.lng = lng;
    weatherCoreData.lat = lat;
    weatherCoreData.temperature = [NSString stringWithFormat:@"%@", temperature];
    weatherCoreData.imageUrl = imageUrl;
    weatherCoreData.name = name;
    
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
}


#pragma mark - Reload Messages & Dialogs

- (NSMutableArray *) getWeather
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Weather"];

    [request setReturnsObjectsAsFaults:NO];

    NSError *requestError = nil;

    NSMutableArray *weatherList = [[managedObjectContext executeFetchRequest:request error:&requestError] mutableCopy];

    if (weatherList)
    {
        NSLog(@"%@", [requestError localizedDescription]);
    }

    return weatherList;

}


#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TestProgect" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Weathers.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}


- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end

//
//  FavoriteMoviesDataStore.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/18/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoriteMoviesDataStore.h"

@implementation FavoriteMoviesDataStore


+(FavoriteMoviesDataStore *)sharedDataStore {
    
    
    static FavoriteMoviesDataStore *_sharedDataStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        _sharedDataStore = [[FavoriteMoviesDataStore alloc]init];
        
    });
    NSLog(@" WHAT IS IN HERE ! %@", _sharedDataStore);
    
    return  _sharedDataStore;
    
}
-(void)fetchData {
    
        NSFetchRequest *allItemsRequest = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
        self.favoriteMovies = [self.managedObjectContext executeFetchRequest:allItemsRequest error:nil];
    NSLog(@"end of fetch");

}
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

-(void)deleteItem {
    
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSLog(@" What are you %@", context);
    
    NSManagedObject *contextM = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"Movie"
                                   inManagedObjectContext:context];
    
    NSLog(@" what are youuuu %@", contextM);
    
    [context deleteObject:contextM];

    
    [self saveContext];
    
    NSError *error;
    if (![context save:&error]) {
        // Handle the error.
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"MovieModel.sqlite"];
    
    NSError *error = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MovieModel" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

//
//  FavoriteMoviesDataStore.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/18/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
@interface FavoriteMoviesDataStore : NSObject

+(FavoriteMoviesDataStore *)sharedDataStore; 

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;
-(void)fetchData;

@property (nonatomic, strong) NSArray *favoriteMovies;
@property (nonatomic ,strong) FavoriteMoviesDataStore *dataStore; 

@end

//
//  OmdbAPi.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "OmdbAPi.h"
#import "MainPageViewController.h"
#import "FavoriteMoviesDataStore.h"

@implementation OmdbAPi



// NSoperation que
// Image downloading collectionview operation

+(void)getMoviesForSelection:(NSString *)searchedMovieName WithCompletion:(void (^) (NSArray *movies)) completion {
    
    NSString *newString = [searchedMovieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    //searchedMovieName = [NSString stringWithFormat:@"s=star+wars&page=1"];
   // NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&page=1",newString];
    
   NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=star+wars&page=1"];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [responseObject valueForKey:@"Search"];
        
        NSMutableArray *movieObjects = [NSMutableArray new];
        
        for (NSDictionary *singleMovie  in moviesSorted) {
            
            // Movie *movie = [[Movie alloc]initWithDictionary:singleMovie];

            FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
            Movie *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
            
            movie.title = [singleMovie valueForKey:@"Title"];
            movie.type = [singleMovie valueForKey:@"Type"];
            movie.omdbID = [singleMovie valueForKey:@"imdbID"];
            movie.poster = [singleMovie valueForKey:@"Poster"];
            
            movie.year = [singleMovie valueForKey:@"Year"];
            movie.director = [singleMovie valueForKey:@"Director"];
            movie.writer = [singleMovie valueForKey:@"Writer"];
            movie.stars = [singleMovie valueForKey:@"Actors"];
            movie.imdbScore = [singleMovie valueForKey:@"imdbRating"];
            movie.plot = [singleMovie valueForKey:@"Plot"];
            
            [movieObjects addObject:movie];
            
        }
        completion(movieObjects); 
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@",error);
    }];

}
+(void)getMovieForSelection:(NSString *)movieID withCompletion:(void (^) (Movie *movie))completion{
    
    movieID = movieID;
    NSLog(@"movie id is %@",movieID); 
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=short&r=json",movieID];
    NSLog(@" URL STRING IS %@",urlString); 
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
        
        FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
        Movie *movieTapped = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
        
        for (NSDictionary *singleMovie in moviesSorted) {
            FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
            Movie *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
            
            movie.title = [singleMovie valueForKey:@"Title"];
            movie.type = [singleMovie valueForKey:@"Type"];
            movie.omdbID = [singleMovie valueForKey:@"imdbID"];
            movie.poster = [singleMovie valueForKey:@"Poster"];
            
            movie.year = [singleMovie valueForKey:@"Year"];
            movie.director = [singleMovie valueForKey:@"Director"];
            movie.writer = [singleMovie valueForKey:@"Writer"];
            movie.stars = [singleMovie valueForKey:@"Actors"];
            movie.imdbScore = [singleMovie valueForKey:@"imdbRating"];
            movie.plot = [singleMovie valueForKey:@"Plot"];
            
            movieTapped = movie;
            
        }
       completion(movieTapped);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        NSLog(@" ERROR: %@",error); 
        
    }];

}


+(void)getPlotSelection:(NSString *)movieID withCompletion:(void (^) (Movie *movie))completion{
    
    movieID = movieID;
    NSLog(@"movie id is %@",movieID);
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=full&r=json",movieID];
    NSLog(@" URL STRING IS %@",urlString);
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
        
        FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
        Movie *movieTapped = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
        
        for (NSDictionary *singleMovie in moviesSorted) {
            FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
            Movie *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
            
            movie.title = [singleMovie valueForKey:@"Title"];
            movie.type = [singleMovie valueForKey:@"Type"];
            movie.omdbID = [singleMovie valueForKey:@"imdbID"];
            movie.poster = [singleMovie valueForKey:@"Poster"];
            
            movie.year = [singleMovie valueForKey:@"Year"];
            movie.director = [singleMovie valueForKey:@"Director"];
            movie.writer = [singleMovie valueForKey:@"Writer"];
            movie.stars = [singleMovie valueForKey:@"Actors"];
            movie.imdbScore = [singleMovie valueForKey:@"imdbRating"];
            movie.plot = [singleMovie valueForKey:@"Plot"];
            
            movieTapped = movie;
            
        }
        completion(movieTapped);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@" ERROR: %@",error);
        
    }];
    
}


@end

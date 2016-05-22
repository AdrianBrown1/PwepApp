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
#import "MovieObject.h"

@implementation OmdbAPi



// NSoperation que
// Image downloading collectionview operation

+(void)getMoviesForSelection:(NSString *)searchedMovieName WithCompletion:(void (^) (NSArray *movies)) completion {
    
    NSString *newString = [searchedMovieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    //searchedMovieName = [NSString stringWithFormat:@"s=star+wars&page=1"];
   // NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&page=1",newString];
    
   NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&page=1",newString];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [responseObject valueForKey:@"Search"];
        
        NSMutableArray *movieObjects = [NSMutableArray new];
        
        for (NSDictionary *singleMovie  in moviesSorted) {
           
            MovieObject *movieObject = [[MovieObject alloc]initWithDictionar:singleMovie];
            
           // FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
            
            
            
            [movieObjects addObject:movieObject];
            
        }
        completion(movieObjects); 
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@",error);
    }];

}



+(void)getDictionary:(NSString *)movieID withCompletion:(void (^)(NSDictionary  *dictionary) )completion{
    
    movieID = movieID;
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=short&r=json",movieID];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
        
        NSMutableDictionary *movieDictionary = [NSMutableDictionary new];
        
        for (NSDictionary *singleMovie in moviesSorted) {
            NSLog(@" WHAT is a single movie %@", singleMovie);
            
            [movieDictionary addEntriesFromDictionary:singleMovie];
            
            NSLog(@" \n\n\n\n HAVE I BEEN CHANGED !%@ \n\n\n\n ",movieDictionary); 
        }

        completion(movieDictionary);
        NSLog(@" \n\n\n\n WHAT AM I !! %@ \n\n\n\n\n",movieDictionary);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@" \n\n\n\n\n ERROR: %@ \n\n\n\n ",error);
        
    }];
   
}

+(void)getFullDictionary:(NSString *)movieID withCompletion:(void (^)(NSDictionary  *dictionary) )completion{
    
    movieID = movieID;
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=full&r=json",movieID];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
        
        NSMutableDictionary *movieDictionary = [NSMutableDictionary new];
        
        for (NSDictionary *singleMovie in moviesSorted) {
            NSLog(@" WHAT is a single movie %@", singleMovie);
            
            [movieDictionary addEntriesFromDictionary:singleMovie];
            
            NSLog(@" \n\n\n\n HAVE I BEEN CHANGED !%@ \n\n\n\n ",movieDictionary);
        }
        
        completion(movieDictionary);
        NSLog(@" \n\n\n\n WHAT AM I !! %@ \n\n\n\n\n",movieDictionary);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@" \n\n\n\n\n ERROR: %@ \n\n\n\n ",error);
        
    }];
    
}




//+(void)getMovieForSelection:(NSString *)movieID withCompletion:(void (^) (Movie *movie))completion{
//    
//    movieID = movieID;
//    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=short&r=json",movieID];
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    
//    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
//        
//        FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
//       
//      Movie *movieTapped = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
//        
//        
//        for (NSDictionary *singleMovie in moviesSorted) {
//
//            movieTapped.title = [singleMovie valueForKey:@"Title"];
//            movieTapped.type = [singleMovie valueForKey:@"Type"];
//            movieTapped.omdbID = [singleMovie valueForKey:@"imdbID"];
//            movieTapped.poster = [singleMovie valueForKey:@"Poster"];
//            
//            movieTapped.year = [singleMovie valueForKey:@"Year"];
//            movieTapped.director = [singleMovie valueForKey:@"Director"];
//            movieTapped.writer = [singleMovie valueForKey:@"Writer"];
//            movieTapped.stars = [singleMovie valueForKey:@"Actors"];
//            movieTapped.imdbScore = [singleMovie valueForKey:@"imdbRating"];
//            movieTapped.plot = [singleMovie valueForKey:@"Plot"];
//            
//        }
//       completion(movieTapped);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    
//        NSLog(@" ERROR: %@",error); 
//        
//    }];
//
//}
//
//
//
//+(void)getPlotSelection:(NSString *)movieID withCompletion:(void (^) (Movie *movie))completion{
//    
//    movieID = movieID;
//    NSLog(@"movie id is %@",movieID);
//    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=full&r=json",movieID];
//    NSLog(@" URL STRING IS %@",urlString);
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    
//    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSArray *moviesSorted = [NSArray arrayWithObject:responseObject];
//        
//        FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
//        Movie *movieTapped = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
//        
//        
//        for (NSDictionary *singleMovie in moviesSorted) {
//            
//            movieTapped.title = [singleMovie valueForKey:@"Title"];
//            movieTapped.type = [singleMovie valueForKey:@"Type"];
//            movieTapped.omdbID = [singleMovie valueForKey:@"imdbID"];
//            movieTapped.poster = [singleMovie valueForKey:@"Poster"];
//            
//            movieTapped.year = [singleMovie valueForKey:@"Year"];
//            movieTapped.director = [singleMovie valueForKey:@"Director"];
//            movieTapped.writer = [singleMovie valueForKey:@"Writer"];
//            movieTapped.stars = [singleMovie valueForKey:@"Actors"];
//            movieTapped.imdbScore = [singleMovie valueForKey:@"imdbRating"];
//            movieTapped.plot = [singleMovie valueForKey:@"Plot"];
//            
//            
//        }
//        completion(movieTapped);
//
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        NSLog(@" ERROR: %@",error);
//        
//    }];
//    
//}


@end

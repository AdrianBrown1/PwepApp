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

@interface OmdbAPi ()
@property (nonatomic) NSInteger number;

@end

@implementation OmdbAPi





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
            
            [movieObjects addObject:movieObject];
            
        }
        completion(movieObjects); 
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@",error);
    }];

}

+(void)getMoreMoviesForSelection:(NSString *)searchedMovieName WithCompletion:(void (^) (NSArray *movies)) completion {
    
    NSString *newString = [searchedMovieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSUInteger one = 1;
    
    if (one >= 1) {
        
        one = one + 1;
        
    }
    
    NSLog(@"%lu",one);
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&page=%lu",newString,one];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [responseObject valueForKey:@"Search"];
        
        NSMutableArray *movieObjects = [NSMutableArray new];
        
        for (NSDictionary *singleMovie  in moviesSorted) {
            
            MovieObject *movieObject = [[MovieObject alloc]initWithDictionar:singleMovie];
            
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



@end

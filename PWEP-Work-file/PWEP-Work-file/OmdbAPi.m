//
//  OmdbAPi.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "OmdbAPi.h"
#import "MainPageViewController.h"

@implementation OmdbAPi



// NSoperation que
// Image downloading collectionview operation

+(void)getMoviesForSelection:(NSString *)searchedMovieName WithCompletion:(void (^) (NSArray *movies)) completion {
    NSString *newString = [searchedMovieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    searchedMovieName = [NSString stringWithFormat:@"s=star+wars&page=1"];
   // NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?%@",searchedMovieName];
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?s=star+wars&page=1"];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moviesSorted = [responseObject valueForKey:@"Search"];
        
        NSMutableArray *movieObjects = [NSMutableArray new];
        
        for (NSDictionary *singleMovie  in moviesSorted) {
            
            
            Movie *movie = [[Movie alloc]initWithDictionary:singleMovie];
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
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&plot=full&r=json",movieID];
    NSLog(@" URL STRING IS %@",urlString); 
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"response object %@",responseObject);
        
       // completion();
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        NSLog(@" ERROR: %@",error); 
        
    }];

}

@end

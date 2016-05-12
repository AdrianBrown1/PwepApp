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

        NSMutableArray *movieObjects = [NSMutableArray new];
        
        NSMutableArray *movies = [NSMutableArray new];
        
        [movies addObject:responseObject];
        
        NSArray *moviesSorted = [movies valueForKey:@"Search"];
      //  NSLog(@" Movies Sorted : %@",moviesSorted);
        
        
        for (NSArray *singleMovie  in moviesSorted) {
            
            for (NSDictionary *reallySingleMovie in singleMovie) {
                 Movie *movie = [[Movie alloc]initWithDictionary:reallySingleMovie];
                 [movieObjects addObject:movie];
            }
            
           
        }
        
       NSLog(@"Array of movies: %@", movieObjects);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error : %@",error);
    }];
    

}

@end

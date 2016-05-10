//
//  OmdbAPi.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Movie.h"

@interface OmdbAPi : NSObject

@property (nonatomic, strong) NSMutableArray *movieObjects; 

+(void)getMoviesForSelection:(NSString *)searchedMovieName WithCompletion:(void (^) (NSArray *movies)) completion;
@end

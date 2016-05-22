//
//  MovieObject.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/20/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "MovieObject.h"

@implementation MovieObject




-(instancetype)initWithDictionar:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"Title"];
        _type = [dictionary valueForKey:@"Type"];
        _omdbID = [dictionary valueForKey:@"imdbID"];
        _poster = [dictionary valueForKey:@"Poster"];
        
        _year = [dictionary valueForKey:@"Year"];
        _director = [dictionary valueForKey:@"Director"];
        _writer = [dictionary valueForKey:@"Writer"];
        _stars = [dictionary valueForKey:@"Actors"];
        _imdbScore = [dictionary valueForKey:@"imdbRating"];
        _plot = [dictionary valueForKey:@"Plot"];
    }
    return self; 
}
@end

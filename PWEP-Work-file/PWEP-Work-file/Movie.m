//
//  Movie.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/9/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        dictionary = [NSMutableDictionary new];
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title
                        year:(NSString *)year
                        type:(NSString *)type
                      omdbID:(NSString *)omdbID
                      poster:(NSString *)poster {
    self = [super init];
    if (self) {
        _title = title;
        _year = year;
        _type = type;
        _omdbID = omdbID;
        _poster = poster;
    }
    return self;
}

-(void)parseInfo {
    // 
}

@end

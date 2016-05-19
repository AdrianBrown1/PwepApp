//
//  Movie.m
//  
//
//  Created by Adrian Brown  on 5/18/16.
//
//

#import "Movie.h"

@implementation Movie

// Insert code here to add functionality to your managed object subclass
-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary valueForKey:@"Title"];
        self.type = [dictionary valueForKey:@"Type"];
        self.omdbID = [dictionary valueForKey:@"imdbID"];
        self.poster = [dictionary valueForKey:@"Poster"];
        
        self.year = [dictionary valueForKey:@"Year"];
        self.director = [dictionary valueForKey:@"Director"];
        self.writer = [dictionary valueForKey:@"Writer"];
        self.stars = [dictionary valueForKey:@"Actors"];
        self.imdbScore = [dictionary valueForKey:@"imdbRating"];
        self.plot = [dictionary valueForKey:@"Plot"];
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
        self.title = title;
        self.year = year;
        self.type = type;
        self.omdbID = omdbID;
        self.poster = poster;
    }
    return self;
}

-(void)parseInfo {
    //
}


@end

//
//  MovieObject.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/20/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieObject : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *plot;
@property(nonatomic, strong) NSString *poster;
@property(nonatomic, strong) NSString *writer;
@property(nonatomic, strong) NSString *director;
@property(nonatomic, strong) NSString *year;
@property(nonatomic, strong) NSString *omdbID;
@property(nonatomic, strong) NSString *stars;
@property(nonatomic, strong) NSString *imdbScore;
@property(nonatomic, strong) NSString *type;






-(instancetype)initWithDictionar:(NSDictionary *)dictionary;
@end

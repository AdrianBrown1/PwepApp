//
//  Movie.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/9/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *year;
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *omdbID;
@property (nonatomic, strong)NSString *poster;

@property (nonatomic,strong)NSString *director;
@property (nonatomic,strong)NSString *writer;
@property (nonatomic,strong)NSString *stars;
@property (nonatomic,strong)NSString *imdbScore;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(instancetype)initWithTitle:(NSString *)title year:(NSString *)year type:(NSString*)type omdbID:(NSString *)omdbID poster:(NSString *)poster;


-(void)parseInfo;



@end

//
//  Movie.h
//  
//
//  Created by Adrian Brown  on 5/18/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSManagedObject

// Insert code here to declare functionality of your managed object subclass


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(instancetype)initWithTitle:(NSString *)title year:(NSString *)year type:(NSString*)type omdbID:(NSString *)omdbID poster:(NSString *)poster;


-(void)parseInfo;



@end

NS_ASSUME_NONNULL_END

#import "Movie+CoreDataProperties.h"

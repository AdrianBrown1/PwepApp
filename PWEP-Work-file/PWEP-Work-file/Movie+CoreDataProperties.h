//
//  Movie+CoreDataProperties.h
//  
//
//  Created by Adrian Brown  on 5/18/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface Movie (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *year;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSString *omdbID;
@property (nullable, nonatomic, retain) NSString *poster;
@property (nullable, nonatomic, retain) NSString *director;
@property (nullable, nonatomic, retain) NSString *writer;
@property (nullable, nonatomic, retain) NSString *stars;
@property (nullable, nonatomic, retain) NSString *imdbScore;
@property (nullable, nonatomic, retain) NSString *plot;

@end

NS_ASSUME_NONNULL_END

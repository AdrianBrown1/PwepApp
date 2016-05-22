//
//  MovieDecsriptionViewController.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteMoviesDataStore.h"

@interface MovieDecsriptionViewController : UIViewController

@property (weak, nonatomic) NSString *imdbID;

@property (strong, nonatomic) Movie *movie;

@end

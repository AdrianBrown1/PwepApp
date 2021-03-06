//
//  SelectedMovieViewController.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPageViewController.h"
#import "OmdbAPi.h"
#import "MovieDecsriptionViewController.h"
#import "FavoriteMoviesDataStore.h"


@interface SelectedMovieViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UITextView *movieTextView;
@property (weak, nonatomic) IBOutlet UILabel *releasedLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *imdbScoreLabel;


@property (strong, nonatomic) NSString *imdbID;
@property (strong, nonatomic) Movie *movie;
@property (strong, nonatomic)NSMutableDictionary *dictionary;
@property (weak, nonatomic) IBOutlet UILabel *PosterLabel;

@end

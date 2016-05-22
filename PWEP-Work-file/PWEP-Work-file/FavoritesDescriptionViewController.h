//
//  FavoritesDescriptionViewController.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/30/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface FavoritesDescriptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *blurBackGroundView;
@property (weak, nonatomic) IBOutlet UIView *posterImage;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UITextView *plotText;
@property (weak, nonatomic) IBOutlet UIStackView *releasedLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *imdbScoreLabel;

@property (strong, nonatomic)Movie *movie;

@end

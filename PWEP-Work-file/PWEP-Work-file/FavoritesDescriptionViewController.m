//
//  FavoritesDescriptionViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/30/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoritesDescriptionViewController.h"
#import "OmdbAPi.h"
#import "FavoritesPlotViewController.h"
@interface FavoritesDescriptionViewController ()



@end

@implementation FavoritesDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [OmdbAPi getDictionary:self.movie.omdbID withCompletion:^(NSDictionary *dictionary) {
    
        NSString *director = [NSString stringWithFormat:@"Director: %@",[dictionary valueForKey:@"Director"]];
        NSString *writer = [NSString stringWithFormat:@"Writer: %@",[dictionary valueForKey:@"Writer"]];
        NSString *stars = [NSString stringWithFormat:@"Stars: %@",[dictionary valueForKey:@"Actors"]];
        NSString *year = [NSString stringWithFormat:@"Released: %@",[dictionary valueForKey:@"Year"]];
        NSString *imdbScore = [NSString stringWithFormat:@"IMDB Score: %@",[dictionary valueForKey:@"imdbRating"]];
        NSString *plot = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Plot"]];
        
        self.directorLabel.text = director;
        self.writerLabel.text = writer;
        self.starsLabel.text = stars;
        self.imdbScoreLabel.text = imdbScore;
        self.plotText.text = plot;
        self.releasedLabel.text = year;
        
        [self.directorLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.writerLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.starsLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.releasedLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.imdbScoreLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];

        
        self.plotText.layer.cornerRadius = 10;

        
        NSOperationQueue *backgroundQueue = [NSOperationQueue new];
        
        [backgroundQueue addOperationWithBlock:^{
            
            NSString *urlString = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Poster"]];
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            UIImage *posterImage = [UIImage imageWithData:data];
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                
                self.image.image = posterImage;
                
            }];
            
        }];
   
    
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"plotSegue"])
    {
        FavoritesPlotViewController *destinationVC = [segue destinationViewController];
        destinationVC.movie = self.movie;
    }


}


@end

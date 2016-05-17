//
//  SelectedMovieViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "SelectedMovieViewController.h"
#import "MainPageViewController.h"
#import "OmdbAPi.h"
#import "MovieDecsriptionViewController.h"
@interface SelectedMovieViewController ()


@end

@implementation SelectedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
           [OmdbAPi getMovieForSelection:self.imdbID withCompletion:^(Movie *movie) {
    
               self.directorLabel.text = [NSString stringWithFormat:@"Director: %@",movie.director];
               self.writerLabel.text = [NSString stringWithFormat:@"Writer: %@",movie.writer];
               self.starsLabel.text  = [NSString stringWithFormat:@"Actors: %@ \n",movie.stars];
               self.releasedLabel.text = [NSString stringWithFormat:@"Released: %@",movie.year];
               self.imdbScoreLabel.text = [NSString stringWithFormat:@"IMDB Score: %@",movie.imdbScore];
               self.movieTextView.text = movie.plot;
    
    
               NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
               [backgroundQueue addOperationWithBlock:^{
    
                   NSURL *url = [NSURL URLWithString:movie.poster];
    
                   NSData *data = [NSData dataWithContentsOfURL:url];
    
                   UIImage *posterImage = [UIImage imageWithData:data];
    
                   [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                       self.movieImage.image = posterImage;
                       
                   }];
                }];
           }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FullPlotButtonTapped:(id)sender {
    
    NSLog(@" Ive been tapped!");
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"plotSegue"])
    {
        MovieDecsriptionViewController *destinationVC = [segue destinationViewController];
        destinationVC.imdbID = self.imdbID;
    }

}


@end

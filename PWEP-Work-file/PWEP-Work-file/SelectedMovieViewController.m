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
#import "FavoriteMoviesDataStore.h"
@interface SelectedMovieViewController ()
@property (nonatomic,strong)Movie *movieToBeSaved;

@end

@implementation SelectedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
    self.movieToBeSaved = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
    
           [OmdbAPi getMovieForSelection:self.imdbID withCompletion:^(Movie *movie) {
               
               self.movieToBeSaved = movie;
               NSLog(@"\n\n\n\n Movie !: %@ \n\n\n\n",self.movieToBeSaved);
               
               self.directorLabel.text = [NSString stringWithFormat:@"Director: %@",movie.director];
               self.writerLabel.text = [NSString stringWithFormat:@"Writer: %@",movie.writer];
               NSLog(@" \n\n\n\n Writer: %@ \n\n\n\n",movie.writer);
               
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
//                   self.movieToBeSaved = movie;
                   
                   
                }];
           }];


    
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"favorite"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(FavoriteMovie:)];
    self.navigationItem.rightBarButtonItem = barButton;

    

    
}

-(IBAction)FavoriteMovie:(id)sender{

    NSLog(@"Ive been tapped !!");
    
    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
    Movie *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
    
    NSLog(@" \n\n\n\n WHAT IS THE MOVIE BEING TAPPED %@ \n\n\n\n", self.movieToBeSaved);
    
    movie = self.movieToBeSaved;
    
    NSLog(@"\n\n\n\n\n What is a movie %@ \n\n\n\n\n",movie);
    
    [dataStore saveContext];
    
    
    
    
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

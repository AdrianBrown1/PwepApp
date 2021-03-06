//
//  SelectedMovieViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "SelectedMovieViewController.h"
#import "MovieObject.h"
@interface SelectedMovieViewController ()
@property (nonatomic,strong)Movie *movieToBeSaved;

@end

@implementation SelectedMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dictionary = [NSMutableDictionary new];
    
    [OmdbAPi getDictionary:self.movie.omdbID withCompletion:^(NSDictionary *dictionary) {
        
        
        NSString *director = [NSString stringWithFormat:@"Director: %@",[dictionary valueForKey:@"Director"]];
        NSString *writer = [NSString stringWithFormat:@"Writer: %@",[dictionary valueForKey:@"Writer"]];
        NSString *stars = [NSString stringWithFormat:@"Stars: %@",[dictionary valueForKey:@"Actors"]];
        NSString *year = [NSString stringWithFormat:@"Released: %@",[dictionary valueForKey:@"Year"]];
        NSString *imdbScore = [NSString stringWithFormat:@"IMDB Score: %@",[dictionary valueForKey:@"imdbRating"]];
        NSString *plot = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Plot"]];
        NSString *poster = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Poster"]];
        NSString *title = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Title"]];
        
        self.directorLabel.text = director;
        self.writerLabel.text = writer;
        self.starsLabel.text = stars;
        self.releasedLabel.text = year;
        self.imdbScoreLabel.text = imdbScore;
        self.movieTextView.text = plot;
        
        
        [self.directorLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.writerLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.starsLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.releasedLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
        [self.imdbScoreLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];

        self.movieTextView.layer.cornerRadius = 10;
        
        
        if ([poster isEqualToString:@"N/A"]) {
            NSLog(@"%@",poster);
            
            self.PosterLabel.text = title;
            self.movieImage.image =[UIImage imageNamed:@"whiteblank.jpg"];
        }
        else {
        
        NSOperationQueue *backgroundQueue = [NSOperationQueue new];
        
        [backgroundQueue addOperationWithBlock:^{
            
            NSString *urlString = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Poster"]];
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            UIImage *posterImage = [UIImage imageWithData:data];
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                
                self.movieImage.image = posterImage;
                
            }];
            
        }];
    }
        
        [self.dictionary addEntriesFromDictionary:dictionary];
        
    }];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Favorite"
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(FavoriteMovie:)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    
    
    
}

-(IBAction)FavoriteMovie:(id)sender{
    
    NSLog(@"Ive been tapped !!");
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Congradulations"                                         message:@"Movie has been added to favorites"                                    preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil]; 
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
    Movie *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:dataStore.managedObjectContext];
    
    NSString *director = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Director"]];
    NSString *writer = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Writer"]];
    NSString *stars = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Actors"]];
    NSString *year = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Year"]];
    NSString *imdbScore = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"imdbRating"]];
    NSString *plot = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Plot"]];
    NSString *omdbID = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"imdbID"]];
    NSString *title = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Title"]];
    NSString *type = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Type"]];
    NSString *poster = [NSString stringWithFormat:@"%@",[self.dictionary valueForKey:@"Poster"]];
    
    
    movie.director = director;
    movie.imdbScore = imdbScore;
    movie.plot = plot;
    movie.stars = stars;
    movie.writer = writer;
    movie.omdbID = omdbID;
    movie.poster = poster;
    movie.title = title;
    movie.type = type;
    movie.year = year;
    
    NSLog(@"about to save to coreData");
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
        destinationVC.movie = self.movie;
    }
    
}


@end

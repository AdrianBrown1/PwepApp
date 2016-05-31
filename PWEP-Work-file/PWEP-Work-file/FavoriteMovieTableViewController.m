//
//  FavoriteMovieTableViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/19/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoriteMovieTableViewController.h"
#import "FavoriteMoviesDataStore.h"
#import "FavovriteMovieTableViewCell.h"
#import "FavoritesDescriptionViewController.h"

@interface FavoriteMovieTableViewController ()

@property (nonatomic, strong)Movie *movie;
@property (nonatomic, strong)NSMutableArray *allMovies;

@end

@implementation FavoriteMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allMovies = [NSMutableArray new];
    
    
    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
    
    [dataStore fetchData];
    
    
    
    
    [self.allMovies addObjectsFromArray:dataStore.favoriteMovies];
    

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allMovies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavovriteMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteMovieCell" forIndexPath:indexPath];
    
   self.movie = [self.allMovies objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = self.movie.title;
    cell.writerLabel.text = self.movie.writer;
    cell.actorsLabel.text = self.movie.stars;
    
    
    // need to set image still 
    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
    [backgroundQueue addOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:self.movie.poster];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *posterImage = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            cell.posterImage.image = posterImage;
            
        }];
        
        
    }];

    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"movieCellSegue"] ) {
       
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];


        FavoritesDescriptionViewController *destinationVC = [segue destinationViewController];
        
        
        destinationVC.movie = [self.allMovies objectAtIndex:indexPath.row]; ;
        
    }
}


@end

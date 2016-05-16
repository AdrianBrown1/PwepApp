//
//  MainPageViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "MainPageViewController.h"
#import "ReloadDataFooterCollectionReusableView.h"
#import "MovieCollectionViewCell.h"
#import "Movie.h"
#import "SelectedMovieViewController.h"

@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UISearchBar *sBar;
@property (weak, nonatomic)UIButton *button;
@property (nonatomic, strong)Movie *movie;
@property (nonatomic) NSIndexPath *indexPath;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.MovieArray = [NSMutableArray new];
    //Search Bar
    self.sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,10,self.navigationController.navigationBar.bounds.size.width,self.navigationController.navigationBar.bounds.size.height/2)];
   
    self.sBar.delegate = self;
    self.navigationItem.titleView = self.sBar;
        
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    [self buttonPressed:self.button];
    
    NSString *starwars = [NSString stringWithFormat:@"s=star+wars&page=1"];
    
    [OmdbAPi getMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];

            [self.collectionView reloadData];

        }];
        
    }];
    NSLog(@" WHAT IS THE INDEX PATH ! %@",self.indexPath);
    
//    NSLog(@" data was reloaded ! %@",self.MovieArray);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
   MovieCollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
        // once you have image, jump on main queue and assign value to cell.cellImage.image
    
    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
    [backgroundQueue addOperationWithBlock:^{
        
            // write statements to download image
            // NSData... dataWithContents...
            // NSURL...
        
            
        Movie *singleMovie = self.MovieArray[indexPath.row];
        
            NSURL *url = [NSURL URLWithString:singleMovie.poster];
            
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            UIImage *posterImage = [UIImage imageWithData:data];
            
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
             movieCell.cellImage.image = posterImage;

        
        }];
        
        
    }];

    return movieCell;
}

//-(void)collectionView:(UICollectionView *)collectionView
//      willDisplayCell:(UICollectionViewCell *)cell
//   forItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    MovieCollectionViewCell *movieCell = (MovieCollectionViewCell *)cell;
//    
//    // SET UP CELL PROPERTIES
//    
//    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
//    
//    [backgroundQueue addOperationWithBlock:^{
//
//        // write statements to download image
//        // NSData... dataWithContents...
//        // NSURL...
//        
//        NSURL *url = [NSURL URLWithString:self.movie.poster];
//        NSLog(@" what is a movie ? %@",self.movie.poster);
//        
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        
//        UIImage *posterImage = [UIImage imageWithData:data];
//        movieCell.cellImage.image = posterImage;
//        
//    }];
//    
//    [self.collectionView reloadData];
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.MovieArray.count;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.indexPath = [NSIndexPath indexPathWithIndex:indexPath.row];
    NSLog(@" This is the new index path ! %@", self.indexPath);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"MovieSelectedSegue"])
    {
        Movie *movieTapped = [self.MovieArray objectAtIndex:self.indexPath.row];
        NSLog(@"movie tapped id %@",movieTapped.omdbID);
        
       [OmdbAPi getMovieForSelection:movieTapped.omdbID withCompletion:^(Movie *movie) {
           //
       }];
        
        SelectedMovieViewController *destinationVC = [segue destinationViewController];
        
        NSLog(@"Movie tapped %@",movieTapped);
        
        destinationVC.directorLabel.text = movieTapped.director;
        NSLog(@"director label %@",destinationVC.directorLabel.text);

    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionFooter) {
        ReloadDataFooterCollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
        
        footerview.delegate = self;
        
        reusableview = footerview;
    }
    
    return reusableview;
}

// protocol method being implemented 
-(void)buttonPressed:(UIButton *)button {
    
    NSLog(@"button pressed in collection view");

}


@end

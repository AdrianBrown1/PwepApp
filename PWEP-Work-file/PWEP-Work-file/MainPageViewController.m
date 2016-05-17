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
    
    
    
    NSString *starwars = [NSString stringWithFormat:@"s=star+wars&page=1"];
    
    [OmdbAPi getMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [self.collectionView reloadData];
            
        }];
        
    }];
    
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    NSString *userSearched = searchBar.text;
    
    NSString *newString = [userSearched stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    NSString *userInput = [NSString stringWithFormat:@"s=%@&page=1",newString];
    
    NSLog(@"  \n\n\n USER input %@ \n\n\n",userInput);
    
    [OmdbAPi getMoviesForSelection:userInput WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [self.collectionView reloadData];
            
        }];
        
    }];

    

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



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.MovieArray.count;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.indexPath = indexPath;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if ([[segue identifier] isEqualToString:@"MovieSelectedSegue"])
    {
        
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        Movie *movieTapped = self.MovieArray[selectedIndexPath.item];
    
        SelectedMovieViewController *destinationVC = [segue destinationViewController];
        
        destinationVC.imdbID = movieTapped.omdbID;
    
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
    NSLog(@" Ive been tapped !"); 

    NSString *starwars = [NSString stringWithFormat:@"s=star+wars&page=2"];
    
    [OmdbAPi getMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [self.collectionView reloadData];
            
        }];
        
    }];
    

}


@end

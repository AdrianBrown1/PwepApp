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
    
    NSArray *randomMovie = @[@"star wars", @"ninja",@"basketball",@"racing"];
    
    
    
    NSString *myString = [randomMovie objectAtIndex:arc4random()%[randomMovie count]];
    
    [OmdbAPi getMoviesForSelection:myString WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [self.collectionView reloadData];
            
        }];
        
    }];

    
}

// Hide SearchBar
-(void)hideKeyBoard {
//    [self.sBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    NSString *userSearched = searchBar.text;
    
    NSString *userInput = userSearched;
    
    [self.MovieArray removeAllObjects];
    [OmdbAPi getMoviesForSelection:userInput WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.collectionView reloadData];

            }];
            
        }];
        
    }];
    
    [searchBar resignFirstResponder];
    

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
   MovieCollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
    [backgroundQueue addOperationWithBlock:^{
        
        Movie *singleMovie = self.MovieArray[indexPath.row];
        
        NSLog(@"poster = %@",singleMovie.poster);
        
        if ([singleMovie.poster isEqualToString:@"n/a"]) {
           
            
            movieCell.cellImage.image =[UIImage imageNamed:@"jeremy.jpg"];
        }
        
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
        
        destinationVC.movie = movieTapped;
    
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
    
    NSString *starwars = @"star wars";

    
    
    
    //create a property called search term so when search bar is used it updates the property with the user input
    // once i have the search term i can pass forward that term.
    
    // loading the pages.
    
    // total results value
    
    // pass forward integer value of array count 
    
    
    
    
    [OmdbAPi getMoreMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.MovieArray addObjectsFromArray:movies];
            
            [self.collectionView reloadData];
            
        }];
        
    }];
    

}


@end

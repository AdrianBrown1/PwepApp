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

@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UISearchBar *sBar;
@property (weak, nonatomic)UIButton *button;
@property (nonatomic, strong)Movie *movie;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.MovieArray = [NSMutableArray new];
    //Search Bar
    self.sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,10,self.navigationController.navigationBar.bounds.size.width,self.navigationController.navigationBar.bounds.size.height/2)];
   
    self.sBar.delegate = self;
    self.navigationItem.titleView = self.sBar;
    
    	//[self.navigationController.navigationBar addSubview:self.sBar];
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    [self buttonPressed:self.button];
    
    NSString *starwars = [NSString stringWithFormat:@"s=star+wars&page=1"];
    
    [OmdbAPi getMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            NSLog(@"on main thread");
            NSLog(@" Movies not in array %@",movies);
            
            [self.MovieArray addObjectsFromArray:movies];
            NSLog(@"Movies ARE NOW IN ARRAY ! %@", self.MovieArray);
            
            [self.collectionView reloadData];

        }];
        
    }];
    
    NSLog(@" data was reloaded ! %@",self.MovieArray);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
   
    
    
    NSLog(@"cell for item at index path: %li",indexPath.item);
    
   MovieCollectionViewCell *movieCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
        // once you have image, jump on main queue and assign value to cell.cellImage.image
    
    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
    [backgroundQueue addOperationWithBlock:^{
        
        
            // write statements to download image
            // NSData... dataWithContents...
            // NSURL...
        
            
        Movie *singleMovie = self.MovieArray[indexPath.row];
        
        NSLog(@" here it is ! %@",[singleMovie valueForKey:@"poster"]);
        
//            NSURL *url = [NSURL URLWithString:singleMovie.poster];
//            
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            
//            UIImage *posterImage = [UIImage imageWithData:data];
//            
//            movieCell.cellImage.image = posterImage;
        
        
        
        
        }];
    
    
    
     movieCell.backgroundColor = [UIColor redColor];
//   
//    cell.cellImage.image = [UIImage imageNamed:@"jeremy.jpg"];
  
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
    NSLog(@" count %lu",self.MovieArray.count); 
    return self.MovieArray.count;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Index path %@",indexPath);
    
    
    
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

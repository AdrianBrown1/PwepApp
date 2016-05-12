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
    
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    [myQueue addOperationWithBlock:^{
        
        // Background work
        NSLog(@" currently in backround thread");
        

        [OmdbAPi getMoviesForSelection:starwars WithCompletion:^(NSArray *movies) {
            
            // CONCURRENCY
            
            // you are currently on background thread
            
            // pass value of incoming arrary to local mutable array
            
            // jump on main thread (use either GCD or NSOperation) to reload collection
            
        }];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            // Main thread work (UI usually)
            NSLog(@"back to main thread");
        }];
    }];
    
    
    
    
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    

    
    
    //    Movie *movie = self.localMutableArrayOfMovieObjects[indexPath.item];
    
    // create a background thread operation(queue)
    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
   
        // write statements to download image
        // NSData... dataWithContents...
        // NSURL...
            // once you have image, jump on main queue and assign value to cell.cellImage.image
   
//    self.movie = self.MovieArray[indexPath.item];
//    cell.cellImage.image = [UIImage imageNamed:self.movie.poster];

    
   
    cell.backgroundColor = [UIColor redColor];
   
    cell.cellImage.image = [UIImage imageNamed:@"jeremy.jpg"];
    
    

    
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
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

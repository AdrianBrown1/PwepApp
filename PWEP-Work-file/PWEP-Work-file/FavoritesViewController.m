//
//  FavoritesViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoritesViewController.h"
#import "FavoriteMoviesDataStore.h"
@interface FavoritesViewController ()
@property (nonatomic, strong)NSMutableArray *allMovies;
@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allMovies = [NSMutableArray new];

    NSFetchRequest *allItemsRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieModel"];
    
    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
    
   NSArray *allItems = [dataStore.managedObjectContext executeFetchRequest:allItemsRequest error:nil];
    
    [self.allMovies addObjectsFromArray:allItems];
    
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"favoriteMovieCell" forIndexPath:indexPath];
    
    return cell; 
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

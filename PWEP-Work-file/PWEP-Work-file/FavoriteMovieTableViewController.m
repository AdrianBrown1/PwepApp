//
//  FavoriteMovieTableViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/19/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoriteMovieTableViewController.h"
#import "FavoriteMoviesDataStore.h"
@interface FavoriteMovieTableViewController ()
@property (nonatomic, strong)NSMutableArray *allMovies;

@end

@implementation FavoriteMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.allMovies = [NSMutableArray new];
//    
//    NSFetchRequest *allItemsRequest = [NSFetchRequest fetchRequestWithEntityName:@"MovieModel"];
//    
//    FavoriteMoviesDataStore *dataStore = [FavoriteMoviesDataStore sharedDataStore];
//    
//    NSArray *allItems = [dataStore.managedObjectContext executeFetchRequest:allItemsRequest error:nil];
//    
//    [self.allMovies addObjectsFromArray:allItems];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteMovieCell" forIndexPath:indexPath];
    
    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

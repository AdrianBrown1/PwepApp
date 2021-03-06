//
//  FavoritesPlotViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/30/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoritesPlotViewController.h"
#import "OmdbAPi.h"
@interface FavoritesPlotViewController ()
@property (weak, nonatomic) IBOutlet UITextView *fullPlotText;
@property (weak, nonatomic) IBOutlet UILabel *plotSummaryLabel;

@end

@implementation FavoritesPlotViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fullPlotText.layer.cornerRadius = 10;
    
    [self.plotSummaryLabel setFont:[UIFont fontWithName:@"Avenir" size:30]];
    [self.plotSummaryLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
    
    [self.plotSummaryLabel setFont:[UIFont boldSystemFontOfSize:30]];


    [OmdbAPi getFullDictionary:self.movie.omdbID withCompletion:^(NSDictionary *dictionary) {
       
        NSString *plot = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Plot"]];
        
        self.fullPlotText.text = plot;
    

    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

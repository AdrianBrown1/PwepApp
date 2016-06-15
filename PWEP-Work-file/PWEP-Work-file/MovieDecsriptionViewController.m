//
//  MovieDecsriptionViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "MovieDecsriptionViewController.h"
#import "OmdbAPi.h"
@interface MovieDecsriptionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *plotSummaryLabel;
@property (weak, nonatomic) IBOutlet UITextView *fullPlotTextView;
@end

@implementation MovieDecsriptionViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.plotSummaryLabel setFont:[UIFont fontWithName:@"Avenir" size:30]];
    [self.plotSummaryLabel setTextColor:[UIColor colorWithRed:0.953f green:0.729f blue:0.106f alpha:1.0f]];
    
    [self.plotSummaryLabel setFont:[UIFont boldSystemFontOfSize:30]];
    
    self.fullPlotTextView.layer.cornerRadius = 10;
    [self.fullPlotTextView setFont:[UIFont fontWithName:@"Avenir" size:20]];
    
//    [self.fullPlotTextView setFont:[UIFont boldSystemFontOfSize:20]];
    
    [OmdbAPi getFullDictionary:self.movie.omdbID withCompletion:^(NSDictionary *dictionary) {
        
        NSString *plot = [NSString stringWithFormat:@"%@",[dictionary valueForKey:@"Plot"]];
        
        self.fullPlotTextView.text = plot;
        
        
    }];

}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

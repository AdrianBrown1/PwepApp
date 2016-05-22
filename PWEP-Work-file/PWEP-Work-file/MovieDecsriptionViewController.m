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

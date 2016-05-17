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

    [OmdbAPi getPlotSelection:self.imdbID withCompletion:^(Movie *movie) {
        
        self.fullPlotTextView.text = movie.plot; 
    }];

}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

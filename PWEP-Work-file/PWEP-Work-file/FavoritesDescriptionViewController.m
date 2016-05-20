//
//  FavoritesDescriptionViewController.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/30/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "FavoritesDescriptionViewController.h"

@interface FavoritesDescriptionViewController ()
@property (weak, nonatomic) IBOutlet UIView *blurBackGroundView;
@property (weak, nonatomic) IBOutlet UIView *posterImage;
@property (weak, nonatomic) IBOutlet UITextView *plotText;
@property (weak, nonatomic) IBOutlet UIStackView *releasedLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@property (weak, nonatomic) IBOutlet UILabel *imdbScoreLabel;


@end

@implementation FavoritesDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

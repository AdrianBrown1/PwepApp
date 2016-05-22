//
//  FavovriteMovieTableViewCell.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/20/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavovriteMovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *writerLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorsLabel;

@end

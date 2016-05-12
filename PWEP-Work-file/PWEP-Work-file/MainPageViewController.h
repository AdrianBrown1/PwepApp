//
//  MainPageViewController.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 4/28/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReloadDataFooterCollectionReusableView.h"
#import "OmdbAPi.h"

@interface MainPageViewController : UIViewController <UISearchBarDelegate , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ButtonDelegate>

@property (nonatomic, strong)NSMutableArray *MovieArray;



@end

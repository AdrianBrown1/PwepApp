//
//  ReloadDataFooterCollectionReusableView.h
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReloadDataFooterCollectionReusableView;

@protocol ButtonDelegate <NSObject>

-(void)buttonPressed:(UIButton *)button;

@end



@interface ReloadDataFooterCollectionReusableView : UICollectionReusableView


-(instancetype)initWithCoder:(NSCoder *)aDecoder;
-(void)commonInit;

@property (nonatomic, weak) id<ButtonDelegate> delegate;

@end

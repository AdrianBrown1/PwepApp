//
//  ReloadDataFooterCollectionReusableView.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "ReloadDataFooterCollectionReusableView.h"



@interface ReloadDataFooterCollectionReusableView ()



@end




@implementation ReloadDataFooterCollectionReusableView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
    
    
}

-(void)commonInit {
    
    // programatically add button and contrain that button etc design it
    
    // create uibutton programttically and how to call on it
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Load Stuff" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(viewButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [button.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    
}

-(void)viewButtonPressed:(UIButton *)button {
    
    if (self.delegate) {
        [self.delegate buttonPressed:button];
    }
    
}


@end

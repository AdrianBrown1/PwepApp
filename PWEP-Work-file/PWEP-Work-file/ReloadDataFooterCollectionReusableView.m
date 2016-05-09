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
    [button.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    [button.centerYAnchor constraintEqualToAnchor:self.centerYAnchor];
    [button sizeToFit];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    button.center = self.center;
    
    [self addSubview:button];
    
    [self buttonPressed:button];
    
}

-(void)buttonPressed:(UIButton *)button {
    
    // after button tapped
    NSLog(@"Ive Been Tapped!!!");
    
    // ill have to write a protocol sending a message to the main age VC lettting it know the button was tapped.
    
    
    
}

//-(void)buttonPressed:(UIButton *)button {
//    
//    // use delegate property and call protocol method
//    [self.delegate someMethod];
//}

@end

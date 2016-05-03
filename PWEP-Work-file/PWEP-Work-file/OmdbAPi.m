//
//  OmdbAPi.m
//  PWEP-Work-file
//
//  Created by Adrian Brown  on 5/2/16.
//  Copyright © 2016 Adrian Brown . All rights reserved.
//

#import "OmdbAPi.h"

@implementation OmdbAPi




-(void)urlStuff {
    
    NSString *baseUrl = @"http://www.omdbapi.com/?";
    NSMutableString *userInput = [NSMutableString new];
    
    [userInput stringByAppendingString:@"mission"];
    
    NSString *url = [NSString stringWithFormat:@"%@s=%@",baseUrl,userInput];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // ...
                                  }];
    
    [task resume];
}


@end

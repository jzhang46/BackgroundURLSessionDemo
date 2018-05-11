//
//  NetworkConnectionManager.h
//  SharedComponent
//
//  Created by sogou on 2018/4/16.
//  Copyright © 2018 sogou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnectionManager : NSObject <NSURLSessionDelegate>

+ (instancetype)sharedInstance;

- (void)startDownloading;

@end

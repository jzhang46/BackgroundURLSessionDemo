//
//  NetworkConnectionManager.m
//  SharedComponent
//
//  Created by sogou on 2018/4/16.
//  Copyright © 2018 sogou. All rights reserved.
//

#import "NetworkConnectionManager.h"

static NSString * const kSessionIdentifier = @"com.sogou.asdf";

@implementation NetworkConnectionManager {
    NSURLSession *_session;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static NetworkConnectionManager *s_sharedInstance;
    dispatch_once(&onceToken, ^{
        s_sharedInstance = [[NetworkConnectionManager alloc] init];
    });
    return s_sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kSessionIdentifier];
        configuration.sharedContainerIdentifier = @"group.com.sogou.testKeyboardNetwork";
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.allowsCellularAccess = NO;
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    }
    return self;
}

- (void)startDownloading {
    NSLog(@"###### start downloading: %@", _session);
//    NSString *strUrl = @"https://github.com/tpn/pdfs/raw/master/Inside%20IO%20Completion%20Ports_files/side_menu_98_information.gif";
    NSString *strUrl = @"https://github.com/thibaultCha/Equiprose/archive/master.zip";
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLSessionDownloadTask *task = [_session downloadTaskWithURL:url];
    [task resume];
}

#pragma mark - NSURLSession delegate methods

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    NSLog(@"###### URL session error: %@", error);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    NSLog(@"###### Background session finish: %@", session);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    NSLog(@"###### Response data received: %@", session);
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"###### downloadTask finished: %@", location);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    double currentProgress = totalBytesWritten / (double)totalBytesExpectedToWrite;
    NSLog(@"### %0.2f",currentProgress);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    NSLog(@"###### downloadTask didResumeAtOffset: %d expectedTotalBytes: %d", fileOffset, expectedTotalBytes);
}
@end

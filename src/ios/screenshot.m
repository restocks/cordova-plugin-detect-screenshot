/********* Screenshot.m Cordova Plugin Implementation *******/

#import "Screenshot.h"
#import <Cordova/CDV.h>

@implementation Screenshot

- (void)pluginInitialize
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                      object:nil
                       queue:mainQueue
                  usingBlock:^(NSNotification *note) {
                    if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
                        // UIWebView
                        [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:@"cordova.fireDocumentEvent('screenshot');" waitUntilDone:NO];
                    } else if ([self.webView respondsToSelector:@selector(evaluateJavaScript:completionHandler:)]) {
                        // WKWebView
                        [self.webView performSelector:@selector(evaluateJavaScript:completionHandler:) withObject:@"cordova.fireDocumentEvent('screenshot');" withObject:nil];
                    } else {
                        // cordova lib version is > 4
                        [self.webView performSelectorOnMainThread:@selector(evaluateJavaScript:completionHandler:) withObject:@"cordova.fireDocumentEvent('screenshot');" waitUntilDone:NO];
                    }
                  }];
    }
}

@end

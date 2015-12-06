   /********* screenshot.m Cordova Plugin Implementation *******/

    #import "screenshot.h"
    #import <Cordova/CDV.h>

    @implementation screenshot
    - (void)pluginInitialize
    {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
            [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                          object:nil
                           queue:mainQueue
                      usingBlock:^(NSNotification *note) {
                        [self.webView stringByEvaluatingJavaScriptFromString:@"cordova.fireDocumentEvent('screenshot');"];
                      }];
        }
    }

    @end
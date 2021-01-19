/********* cqplugin.m Cordova Plugin Implementation *******/

#import <WebKit/WebKit.h>
#import <Cordova/CDV.h>

@interface cqplugin : CDVPlugin {
  // Member variables go here.
}

@property (weak, nonatomic) IBOutlet WKWebView *webview;

@end



@implementation cqplugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)say:(CDVInvokedUrlCommand*)command
{
    NSString* word = [command.arguments objectAtIndex:0];
    NSLog(@"cq says = %@", word);
}

- (void)allowScormAccess:(CDVInvokedUrlCommand*)command
{
    NSString* url = [command.arguments objectAtIndex:0];
    NSURL* scorm = [NSURL URLWithString:url];
    NSURL* scormAccess = [scorm URLByDeletingLastPathComponent];
    [_webview loadFileURL:scorm allowingReadAccessToURL:scormAccess];
}

@end

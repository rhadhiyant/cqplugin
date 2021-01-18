/********* CQPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface CQPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation CQPlugin

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

- (void)say:(NSString*)word
{
    NSLog(@"cq says = %@", word);
}

- (void)allowScormAccess:(NSString*)url
{
    // simulator
    /*
    NSString* preUrl = [[[[[request.URL URLByDeletingLastPathComponent] URLByDeletingLastPathComponent] URLByDeletingLastPathComponent] absoluteString] stringByReplacingOccurrencesOfString:@"/Bundle/" withString:@"/Data/"];
    preUrl = [NSString stringWithFormat:@"%@Documents/", preUrl];
    */
    
    // iphone (not working)
    /*
    NSString* appId = [[[[request.URL URLByDeletingLastPathComponent] URLByDeletingLastPathComponent] URLByDeletingLastPathComponent] lastPathComponent];
    NSString* preUrl = [@"file:///var/mobile/Containers/Data/Application/cq_app_id/Documents/" stringByReplacingOccurrencesOfString:@"cq_app_id" withString:appId];
    
    NSURL* scorm = [NSURL URLWithString:preUrl];
    NSURL* scormAccess = [NSURL URLWithString:preUrl];
     */
    
    // for all using url parameter
    NSURL* scorm = [NSURL URLWithString:url];
    NSURL* scormAccess = [scorm URLByDeletingLastPathComponent];
    
    // debug
    NSLog(@"cqdebug scorm = %@", scorm);
    NSLog(@"cqdebug scormAccess = %@", scormAccess);
    
    // main part
    // [(WKWebView*)_engineWebView loadFileURL:scorm allowingReadAccessToURL:scormAccess];
}

@end

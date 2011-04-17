//
//  InternetStatusAppDelegate.m
//  InternetStatus
//
//  Created by Prakash on 4/17/11.
//  Copyright 2011 Applified Ideas AB. All rights reserved.
//

#import "InternetStatusAppDelegate.h"

@implementation InternetStatusAppDelegate

@synthesize window;

- (void) updateInterfaceWithReachability: (Reachability*) curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    NSString* statusString= @"";
    switch (netStatus)
    {
        case NotReachable:
        {
            statusString = @"No internet access!!";
            status.image = [NSImage imageNamed: @"stop-32.png"] ;
            break;
        }
            
        case Reachable:
        {
            statusString= @"Internet connection available!";
            status.image = [NSImage imageNamed: @"Airport.png"];
            break;
        }
    }
    [statusText setStringValue:statusString];
    
}
//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
    Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);

	[self updateInterfaceWithReachability: curReach];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the
    // method "reachabilityChanged" will be called. 
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    internetReach = [[Reachability reachabilityForInternetConnection] retain];
	[internetReach startNotifier];
	[self updateInterfaceWithReachability: internetReach];

}

- (void) dealloc
{
    [internetReach release];
}

@end

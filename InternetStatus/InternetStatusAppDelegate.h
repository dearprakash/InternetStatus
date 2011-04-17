//
//  InternetStatusAppDelegate.h
//  InternetStatus
//
//  Created by Prakash on 4/17/11.
//  Copyright 2011 Applified Ideas AB. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Reachability.h"

@interface InternetStatusAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    IBOutlet NSImageView* status;
    IBOutlet NSTextField* statusText;
    
    Reachability* internetReach;
}

@property (assign) IBOutlet NSWindow *window;

@end

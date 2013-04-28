

#import "ChattyAppDelegate.h"
#import "ChattyViewController.h"
#import "ChatRoomViewController.h"
#import "WelcomeViewController.h"
#import "DrumViewController.h"
#import "GuitarViewController.h"

static ChattyAppDelegate* _instance;

@implementation ChattyAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize chatRoomViewController;
@synthesize welcomeViewController;
@synthesize drumRoomViewController;
@synthesize guitarViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Allow other classes to use us
    _instance = self;
    
    // Override point for customization after app launch
    [window addSubview:guitarViewController.view];
    [window addSubview:drumRoomViewController.view];
    [window addSubview:chatRoomViewController.view];
    [window addSubview:viewController.view];
    [window addSubview:welcomeViewController.view];
    [window makeKeyAndVisible];

    // Greet user
   [window bringSubviewToFront:welcomeViewController.view];
    
    [welcomeViewController activate];
}


- (void)dealloc {
    [viewController release];
    [chatRoomViewController release];
    [welcomeViewController release];
    [window release];
    [drumRoomViewController release];
    [guitarViewController release];
    [super dealloc];
}


+ (ChattyAppDelegate*)getInstance {
  return _instance;
}




// Show chat room
- (void)showChatRoom:(Room*)room {
    chatRoomViewController.chatRoom = room;
    [chatRoomViewController activate];
    
    [window bringSubviewToFront:chatRoomViewController.view];
}

// switch drum room
- (void)switchDrumRoom:(Room*)room {
    drumRoomViewController.chatRoom = room;
   // drumRoomViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"drum_back.jpg"]];

    
    [window bringSubviewToFront:drumRoomViewController.view];
}

// switch piano room
- (void)switchPianoRoom:(Room*)room {
    chatRoomViewController.chatRoom = room;
    
    [window bringSubviewToFront:chatRoomViewController.view];
}

// switch guitar room
- (void)switchGuitarRoom:(Room*)room {
    guitarViewController.chatRoom = room;
   // guitarViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"guitarback.jpg"]];
    
    
    [window bringSubviewToFront:guitarViewController.view];
}



// Show screen with room selection
- (void)showRoomSelection {
  [viewController activate];
  
  [window bringSubviewToFront:viewController.view];
}


@end



#import <UIKit/UIKit.h>
#import "Room.h"

@class ChattyViewController, ChatRoomViewController, WelcomeViewController, DrumViewController,GuitarViewController;

@interface ChattyAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  ChattyViewController *viewController;
  ChatRoomViewController *chatRoomViewController;
  WelcomeViewController *welcomeViewController;
    DrumViewController *drumRoomViewController;
    GuitarViewController *guitarViewController;
}

@property(nonatomic, retain) IBOutlet UIWindow *window;
@property(nonatomic, retain) IBOutlet ChattyViewController *viewController;
@property(nonatomic, retain) IBOutlet ChatRoomViewController *chatRoomViewController;
@property(nonatomic, retain) IBOutlet WelcomeViewController *welcomeViewController;

@property (retain, nonatomic) IBOutlet DrumViewController *drumRoomViewController;

@property (retain, nonatomic) IBOutlet GuitarViewController *guitarViewController;


// Main instance of the app delegate
+ (ChattyAppDelegate*)getInstance;



// Switch piano room
- (void)switchPianoRoom:(Room*)room;
// Switch drum room
- (void)switchDrumRoom:(Room*)room;
//Switch guitar room
-(void)switchGuitarRoom:(Room*)room;


// Show chat room
- (void)showChatRoom:(Room*)room;

// Go back to the room selection
- (void)showRoomSelection;


@end


#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomDelegate.h"
#import "LeftButton.h"


@interface DrumViewController : UIViewController <RoomDelegate, UITextFieldDelegate> {
    Room* chatRoom;
}

@property(nonatomic,retain) Room* chatRoom;

// Exit back to the welcome screen
- (IBAction)exit;

// View is active, start everything up
- (void)activate;

- (IBAction)piaoswitch:(id)sender;
- (IBAction)guitarswitch:(id)sender;


@end

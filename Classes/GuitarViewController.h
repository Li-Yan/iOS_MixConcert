
#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomDelegate.h"
#import "LeftButton.h"


@interface GuitarViewController : UIViewController <RoomDelegate, UITextFieldDelegate> {
    Room* chatRoom;
}

@property(nonatomic,retain) Room* chatRoom;
@property(nonatomic) CGFloat touchBeginX;
@property(nonatomic) CGFloat touchBeginY;
@property(nonatomic) CGFloat touchMovedX;
@property(nonatomic) CGFloat touchMovedY;
@property(nonatomic) CGFloat touchLastX;


// Exit back to the welcome screen
- (IBAction)exit;

- (IBAction)pianoswitch:(id)sender;
- (IBAction)drumswitch:(id)sender;


// View is active, start everything up
- (void)activate;

@end

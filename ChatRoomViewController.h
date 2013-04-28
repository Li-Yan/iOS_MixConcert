

#import <UIKit/UIKit.h>
#import "Room.h"
#import "RoomDelegate.h"
#import "LeftButton.h"


@interface ChatRoomViewController : UIViewController <RoomDelegate, UITextFieldDelegate> {
  Room* chatRoom;
  IBOutlet UITextView* chat;
  IBOutlet UITextField* input;
}

@property(nonatomic,retain) Room* chatRoom;

// Exit back to the welcome screen
- (IBAction)exit;

// View is active, start everything up
- (void)activate;


@property (retain, nonatomic) IBOutlet LeftButton *leftbutton1;


//switch instrument
- (IBAction)drumswitch:(id)sender;
- (IBAction)guitarswitch:(id)sender;

//test piano view
- (IBAction)blackkey0_pressed:(id)sender;

- (IBAction)blackkey1_pressed:(id)sender;

- (IBAction)blackkey2_pressed:(id)sender;

- (IBAction)key4_pressed:(id)sender;

- (IBAction)key3_pressed:(id)sender;

- (IBAction)key2_pressed:(id)sender;

- (IBAction)key1_pressed:(id)sender;
- (IBAction)key0_pressed:(id)sender;
@end

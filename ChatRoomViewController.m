

#import "ChatRoomViewController.h"
#import "ChattyAppDelegate.h"
#import "UITextView+Utils.h"
#import "AppConfig.h"

#import "SimpleAudioEngine.h"

@implementation ChatRoomViewController

@synthesize chatRoom;

// After view shows up, start the room
- (void)activate {
  if ( chatRoom != nil ) {
    chatRoom.delegate = self;
    [chatRoom start];
  }
  
    //preload the music
    for (int i = 0; i < 6; i++) {
        NSString *audioFileName = [NSString stringWithFormat:@"%i.mp3",i];
        [[SimpleAudioEngine sharedEngine] preloadEffect:audioFileName];
    }
    for (int i = 0; i < 6; i++) {
        NSString *audioFileName = [NSString stringWithFormat:@"d%i.wav",i];
        [[SimpleAudioEngine sharedEngine] preloadEffect:audioFileName];
    }
  
    
  
  //[input becomeFirstResponder];
}

// Cleanup
- (void)dealloc {
    self.chatRoom = nil;
    [_leftbutton1 release];
    [super dealloc];
}


// We are being asked to display a chat message
- (void)displayChatMessage:(NSString*)message fromUser:(NSString*)userName {
    if ([message isEqual: @"0"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"0.mp3"];
    }
    else if ([message isEqual: @"1"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"1.mp3"];
    }
    else if ([message isEqual: @"2"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"2.mp3"];
    }
    else if ([message isEqual: @"3"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"3.mp3"];
    }
    else if ([message isEqual: @"4"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"4.mp3"];
    }
    else if ([message isEqual: @"5"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"5.mp3"];
    }
    else if ([message isEqual: @"6"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"6.mp3"];
    }
    else if ([message isEqual: @"7"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"7.mp3"];
    }
    else if ([message isEqual: @"d0"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d0.wav"];
    }
    else if ([message isEqual: @"d1"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d1.wav"];
    }
    else if ([message isEqual: @"d2"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d2.wav"];
    }
    else if ([message isEqual: @"d3"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d3.wav"];
    }
    else if ([message isEqual: @"d4"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d4.wav"];
    }
    else if ([message isEqual: @"d5"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"d5.wav"];
    }
    else if ([message isEqual: @"g0"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g0.wav"];
    }
    else if ([message isEqual: @"g1"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g1.wav"];
    }
    else if ([message isEqual: @"g2"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g2.wav"];
    }
    else if ([message isEqual: @"g3"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g3.wav"];
    }
    else if ([message isEqual: @"g4"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g4.wav"];
    }
    else if ([message isEqual: @"g5"]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"g5.wav"];
    }
    else{
        [chat appendTextAfterLinebreak:[NSString stringWithFormat:@"%@: %@", userName, message]];
        [chat scrollToBottom];
    }



}
    


// Room closed from outside
- (void)roomTerminated:(id)room reason:(NSString*)reason {
  // Explain what happened
  UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Room terminated" message:reason delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
  [alert show];
  [alert release];
  [self exit];
}


// User decided to exit room
- (IBAction)exit {
  // Close the room
  [chatRoom stop];

  // Remove keyboard
  [input resignFirstResponder];

  // Erase chat
  chat.text = @"";
  
  // Switch back to welcome view
  [[ChattyAppDelegate getInstance] showRoomSelection];
}


#pragma mark -
#pragma mark UITextFieldDelegate Method Implementations

// This is called whenever "Return" is touched on iPhone's keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	if (theTextField == input) {
		// processs input
    [chatRoom broadcastChatMessage:input.text fromUser:[AppConfig getInstance].name];

		// clear input
		[input setText:@""];
        [input resignFirstResponder];
	}
	return YES;
}

- (IBAction)blackkey0_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"5" fromUser:[AppConfig getInstance].name];
}

- (IBAction)blackkey1_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"6" fromUser:[AppConfig getInstance].name];
}

- (IBAction)blackkey2_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"7" fromUser:[AppConfig getInstance].name];
}

- (IBAction)key4_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"4" fromUser:[AppConfig getInstance].name];
}

- (IBAction)key3_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"3" fromUser:[AppConfig getInstance].name];
}

- (IBAction)key2_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"2" fromUser:[AppConfig getInstance].name];
}

- (IBAction)key1_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"1" fromUser:[AppConfig getInstance].name];
}

- (IBAction)key0_pressed:(id)sender {
    [chatRoom broadcastChatMessage:@"0" fromUser:[AppConfig getInstance].name];
}
- (IBAction)drumswitch:(id)sender {
    //switch to drum view
    [[ChattyAppDelegate getInstance] switchDrumRoom:chatRoom];
    
    
}

- (IBAction)guitarswitch:(id)sender {
    //switch to guitar view
    [[ChattyAppDelegate getInstance] switchGuitarRoom:chatRoom];
}
@end

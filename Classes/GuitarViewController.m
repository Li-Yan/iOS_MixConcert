

#import "GuitarViewController.h"
#import "ChattyAppDelegate.h"
#import "UITextView+Utils.h"
#import "AppConfig.h"

#import "SimpleAudioEngine.h"

@implementation GuitarViewController

@synthesize chatRoom;
@synthesize touchBeginX;
@synthesize touchBeginY;
@synthesize touchMovedX;
@synthesize touchMovedY;
@synthesize touchLastX;

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
    
    
    
    //[input becomeFirstResponder];
}




// Cleanup
- (void)dealloc {
    self.chatRoom = nil;
    [super dealloc];
}


// User decided to exit room
- (IBAction)exit {
    // Close the room
    [chatRoom stop];
    
    // Switch back to welcome view
    [[ChattyAppDelegate getInstance] showRoomSelection];
}

- (IBAction)pianoswitch:(id)sender {
    [[ChattyAppDelegate getInstance] switchPianoRoom:chatRoom];
    
}

- (IBAction)drumswitch:(id)sender {
    //switch to drum view
    [[ChattyAppDelegate getInstance] switchDrumRoom:chatRoom];
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
    
}



// Room closed from outside
- (void)roomTerminated:(id)room reason:(NSString*)reason {
    // Explain what happened
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Room terminated" message:reason delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
    [self exit];
}



//touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint pt;
	NSSet *allTouches = [event allTouches];
		UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			pt = [touch locationInView:self.view];
			touchBeginX = pt.x;
			touchBeginY = pt.y;
            touchLastX = pt.x;
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint pt;
	NSSet *allTouches = [event allTouches];
		UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
	
			pt = [touch locationInView:self.view];
			touchMovedX = pt.x;
			touchMovedY = pt.y;
    NSLog(@"touch x: %f\n",touchMovedX);
    if ((touchMovedX > touchBeginX) && ((touchMovedX - touchLastX) >= 20) ){
        touchLastX = touchMovedX;
        //swiping right
        if(touchMovedX >= 300 ){
            [chatRoom broadcastChatMessage:@"g5" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 243 ){
            [chatRoom broadcastChatMessage:@"g4" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 186 ){
            [chatRoom broadcastChatMessage:@"g3" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 129 ){
            [chatRoom broadcastChatMessage:@"g2" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 72 ){
            [chatRoom broadcastChatMessage:@"g1" fromUser:[AppConfig getInstance].name];
        }
        else if (touchMovedX >= 15){
            [chatRoom broadcastChatMessage:@"g0" fromUser:[AppConfig getInstance].name];
        }
  
    }
    else if ((touchMovedX < touchBeginX)&&((touchLastX - touchMovedX) >= 20)){
        touchLastX = touchMovedX;
        //swipe left
        if(touchMovedX >= 300 ){
            [chatRoom broadcastChatMessage:@"g5" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 243 ){
            [chatRoom broadcastChatMessage:@"g4" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 186 ){
            [chatRoom broadcastChatMessage:@"g3" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 129 ){
            [chatRoom broadcastChatMessage:@"g2" fromUser:[AppConfig getInstance].name];
        }
        else if(touchMovedX >= 72 ){
            [chatRoom broadcastChatMessage:@"g1" fromUser:[AppConfig getInstance].name];
        }
        else if (touchMovedX >= 15){
            [chatRoom broadcastChatMessage:@"g0" fromUser:[AppConfig getInstance].name];
        }

        
    }


}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSSet *allTouches = [event allTouches];
		int diffX = touchMovedX - touchBeginX;
		int diffY = touchMovedY - touchBeginY;
		if (diffY >= -20 && diffY <= 20)
		{
 			if (diffX > 20)
			{
				NSLog(@"swipe right");
				// do something here
			}
			else if (diffX < -20)
			{
				NSLog(@"swipe left");
				// do something else here
			}
		}
}






@end



#import "DrumViewController.h"
#import "ChattyAppDelegate.h"
#import "UITextView+Utils.h"
#import "AppConfig.h"

#import "SimpleAudioEngine.h"

@implementation DrumViewController

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
    
    
    
    //[input becomeFirstResponder];
}

- (IBAction)piaoswitch:(id)sender {
    
    [[ChattyAppDelegate getInstance] switchPianoRoom:chatRoom];
   
}

- (IBAction)guitarswitch:(id)sender {
    
    [[ChattyAppDelegate getInstance] switchGuitarRoom:chatRoom];
}



// Cleanup
- (void)dealloc {
    self.chatRoom = nil;
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
    
    // Switch back to welcome view
    [[ChattyAppDelegate getInstance] showRoomSelection];
}


//touch events
- (void) touchesBegan:(NSSet *)touches
            withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    double x = [touch locationInView:self.view].x;
    double y = [touch locationInView:self.view].y;
    double sqr = (x-160)*(x-160) + (y-220)*(y-220);
    double distance = sqrt(sqr);
    
    NSLog(@"%f %f %f %f\n", x,y,sqr, distance);
    
    self.view.backgroundColor = [UIColor redColor];
    if (distance <= 50){
        [chatRoom broadcastChatMessage:@"d0" fromUser:[AppConfig getInstance].name];
    }
    else if (distance <= 100){
        [chatRoom broadcastChatMessage:@"d1" fromUser:[AppConfig getInstance].name];
    }
    else if (distance <= 150){
        [chatRoom broadcastChatMessage:@"d2" fromUser:[AppConfig getInstance].name];
    }
    else if (distance <= 200){
        [chatRoom broadcastChatMessage:@"d3" fromUser:[AppConfig getInstance].name];
    }
    else if (distance <= 250){
        [chatRoom broadcastChatMessage:@"d4" fromUser:[AppConfig getInstance].name];
    }
    else{
        [chatRoom broadcastChatMessage:@"d5" fromUser:[AppConfig getInstance].name];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = [UIColor whiteColor];
}


@end

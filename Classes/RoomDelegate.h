

#import <Foundation/Foundation.h>

@class Room;

@protocol RoomDelegate

- (void) displayChatMessage:(NSString*)message fromUser:(NSString*)userName;
- (void) roomTerminated:(id)room reason:(NSString*)string;

@end

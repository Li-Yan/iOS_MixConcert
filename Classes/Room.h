
#import <Foundation/Foundation.h>
#import "RoomDelegate.h"


@interface Room : NSObject {
  id<RoomDelegate> delegate;
}

@property(nonatomic,retain) id<RoomDelegate> delegate;

- (BOOL)start;
- (void)stop;
- (void)broadcastChatMessage:(NSString*)message fromUser:(NSString*)name;

@end

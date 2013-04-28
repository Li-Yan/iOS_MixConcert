

#import <Foundation/Foundation.h>
#import "ServerDelegate.h"


@interface Server : NSObject {
    uint16_t port;
    CFSocketRef listeningSocket;
    id<ServerDelegate> delegate;
    NSNetService* netService;
}

// Initialize and start listening for connections
- (BOOL)start;
- (void)stop;

// Delegate receives various notifications about the state of our server
@property(nonatomic,retain) id<ServerDelegate> delegate;

@end

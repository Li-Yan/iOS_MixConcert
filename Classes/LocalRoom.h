

#import <Foundation/Foundation.h>
#import "Room.h"
#import "Server.h"
#import "ServerDelegate.h"
#import "ConnectionDelegate.h"


@interface LocalRoom : Room <ServerDelegate, ConnectionDelegate> {
  // We accept connections from other clients using an instance of the Server class
  Server* server;
  
  // Container for all connected clients
  NSMutableSet* clients;
}

// Initialize everything
- (id)init;

@end

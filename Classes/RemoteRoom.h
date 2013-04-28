

#import <Foundation/Foundation.h>
#import "Room.h"
#import "Connection.h"


@interface RemoteRoom : Room <ConnectionDelegate> {
  // Our connection to the chat server
  Connection* connection;
}

// Initialize with host address and port
- (id)initWithHost:(NSString*)host andPort:(int)port;

// Initialize with a reference to a net service discovered via Bonjour
- (id)initWithNetService:(NSNetService*)netService;

@end

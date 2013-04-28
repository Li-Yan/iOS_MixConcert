

#import "RemoteRoom.h"


// Private properties
@interface RemoteRoom ()
@property(nonatomic,retain) Connection* connection;
@end


@implementation RemoteRoom

@synthesize connection;

// Setup connection but don't connect yet
- (id)initWithHost:(NSString*)host andPort:(int)port {
  connection = [[Connection alloc] initWithHostAddress:host andPort:port];
  return self;
}


// Initialize and connect to a net service
- (id)initWithNetService:(NSNetService*)netService {
  connection = [[Connection alloc] initWithNetService:netService];
  return self;
}


// Cleanup
- (void)dealloc {
  self.connection = nil;
  [super dealloc];
}


// Start everything up, connect to server
- (BOOL)start {
  if ( connection == nil ) {
    return NO;
  }
  
  // We are the delegate
  connection.delegate = self;
  
  return [connection connect];
}


// Stop everything, disconnect from server
- (void)stop {
  if ( connection == nil ) {
    return;
  }
  
  [connection close];
  self.connection = nil;
}


// Send chat message to the server
- (void)broadcastChatMessage:(NSString*)message fromUser:(NSString*)name {
  // Create network packet to be sent to all clients
  NSDictionary* packet = [NSDictionary dictionaryWithObjectsAndKeys:message, @"message", name, @"from", nil];

  // Send it out
  [connection sendNetworkPacket:packet];
}


#pragma mark -
#pragma mark ConnectionDelegate Method Implementations

- (void)connectionAttemptFailed:(Connection*)connection {
  [delegate roomTerminated:self reason:@"Wasn't able to connect to server"];
}


- (void)connectionTerminated:(Connection*)connection {
  [delegate roomTerminated:self reason:@"Connection to server closed"];
}


- (void)receivedNetworkPacket:(NSDictionary*)packet viaConnection:(Connection*)connection {
  // Display message locally
  [delegate displayChatMessage:[packet objectForKey:@"message"] fromUser:[packet objectForKey:@"from"]];
}


@end

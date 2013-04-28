

#import <Foundation/Foundation.h>
#import <CFNetwork/CFSocketStream.h>
#import "ConnectionDelegate.h"


@interface Connection : NSObject {
  id<ConnectionDelegate> delegate;
  
  // Connection info: host address and port
  NSString* host;
  int port;
  
  // Connection info: native socket handle
  CFSocketNativeHandle connectedSocketHandle;
  
  // Connection info: NSNetService
  NSNetService* netService;
  
  // Read stream
  CFReadStreamRef readStream;
  bool readStreamOpen;
  NSMutableData* incomingDataBuffer;
  int packetBodySize;
  
  // Write stream
  CFWriteStreamRef writeStream;
  bool writeStreamOpen;
  NSMutableData* outgoingDataBuffer;
}

@property(nonatomic,retain) id<ConnectionDelegate> delegate;

// Initialize and store connection information until 'connect' is called
- (id)initWithHostAddress:(NSString*)host andPort:(int)port;

// Initialize using a native socket handle, assuming connection is open
- (id)initWithNativeSocketHandle:(CFSocketNativeHandle)nativeSocketHandle;

// Initialize using an instance of NSNetService
- (id)initWithNetService:(NSNetService*)netService;

// Connect using whatever connection info that was passed during initialization
- (BOOL)connect;

// Close connection
- (void)close;

// Send network message
- (void)sendNetworkPacket:(NSDictionary*)packet;

@end

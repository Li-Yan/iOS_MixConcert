

#import <Foundation/Foundation.h>

@class Server, Connection;

@protocol ServerDelegate

// Server has been terminated because of an error
- (void) serverFailed:(Server*)server reason:(NSString*)reason;

// Server has accepted a new connection and it needs to be processed
- (void) handleNewConnection:(Connection*)connection;

@end

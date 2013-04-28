
#import <Foundation/Foundation.h>

@class ServerBrowserDelegate;

@interface ServerBrowser : NSObject<NSNetServiceBrowserDelegate>{
  NSNetServiceBrowser* netServiceBrowser;
  NSMutableArray* servers;
  id<ServerBrowserDelegate> delegate;
}

@property(nonatomic,readonly) NSArray* servers;
@property(nonatomic,retain) id<ServerBrowserDelegate> delegate;

// Start browsing for Bonjour services
- (BOOL)start;

// Stop everything
- (void)stop;

@end

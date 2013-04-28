

#import <Foundation/Foundation.h>


@interface AppConfig : NSObject {
  NSString* name;
}

@property (retain) NSString* name;

// Singleton - one instance for the whole app
+ (AppConfig*)getInstance;

@end

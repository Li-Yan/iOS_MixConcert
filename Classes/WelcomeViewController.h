

#import <UIKit/UIKit.h>


@interface WelcomeViewController : UIViewController <UITextFieldDelegate> {
  IBOutlet UITextField* input;
}

// App delegate will call this whenever this view becomes active
- (void)activate;

@end

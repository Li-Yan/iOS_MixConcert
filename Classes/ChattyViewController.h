

#import <UIKit/UIKit.h>
#import "ServerBrowserDelegate.h"
#import "ServerBrowser.h"


@interface ChattyViewController : UIViewController <UITableViewDataSource, ServerBrowserDelegate> {
  ServerBrowser* serverBrowser;
  IBOutlet UITableView* serverList;
}

- (IBAction)createNewChatRoom:(id)sender;
- (IBAction)joinChatRoom:(id)sender;

// View is active, start everything up
- (void)activate;

@end


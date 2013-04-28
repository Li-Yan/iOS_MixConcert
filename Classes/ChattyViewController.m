

#import "ChattyViewController.h"
#import "ChattyAppDelegate.h"
#import "LocalRoom.h"
#import "RemoteRoom.h"


// Private properties
@interface ChattyViewController ()
@property(nonatomic,retain) ServerBrowser* serverBrowser;
@end


@implementation ChattyViewController

@synthesize serverBrowser;

// View loaded
- (void)viewDidLoad {
  serverBrowser = [[ServerBrowser alloc] init];
  serverBrowser.delegate = self;
}


// Cleanup
- (void)dealloc {
  self.serverBrowser = nil;
  [super dealloc];
}


// View became active, start your engines
- (void)activate {
  // Start browsing for services
  [serverBrowser start];
}


// User is asking to create new chat room
- (IBAction)createNewChatRoom:(id)sender {
  // Stop browsing for servers
  [serverBrowser stop];

  // Create local chat room and go
  LocalRoom* room = [[[LocalRoom alloc] init] autorelease];
  [[ChattyAppDelegate getInstance] showChatRoom:room];
}


// User is asking to join an existing chat room
- (IBAction)joinChatRoom:(id)sender {
  // Figure out which server is selected
  NSIndexPath* currentRow = [serverList indexPathForSelectedRow];
  if ( currentRow == nil ) {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Which chat room?" message:@"Please select which chat room you want to join from the list above" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
    return;
  }

  NSNetService* selectedServer = [serverBrowser.servers objectAtIndex:currentRow.row];

  // Create chat room that will connect to that chat server
  RemoteRoom* room = [[[RemoteRoom alloc] initWithNetService:selectedServer] autorelease];
  
  // Stop browsing and switch over to chat room
  [serverBrowser stop];
  [[ChattyAppDelegate getInstance] showChatRoom:room];
}


#pragma mark -
#pragma mark ServerBrowserDelegate Method Implementations

- (void)updateServerList {
  [serverList reloadData];
}


#pragma mark -
#pragma mark UITableViewDataSource Method Implementations

// Number of rows in each section. One section by default.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [serverBrowser.servers count];
}


// Table view is requesting a cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString* serverListIdentifier = @"serverListIdentifier";

  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:serverListIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:serverListIdentifier] autorelease];
	}

  // Set cell's text to server's name
  NSNetService* server = [serverBrowser.servers objectAtIndex:indexPath.row];
  cell.text = [server name];
  
  return cell;
}

@end

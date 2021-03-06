//
//  FeedItemListViewController.m
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import "FeedItemListViewController.h"
#import "FeedItemDetailViewController.h"


@implementation FeedItemListViewController

@synthesize tableView;
@synthesize filterButton;
@synthesize _isFiltered;
@synthesize _refreshHeaderView;
@synthesize _isReloading;

# pragma mark - Init

- (id)initWithState:(BOOL)isFiltered {
    self._isFiltered = isFiltered;
    return [super init];
}

# pragma mark - Button Actions

- (IBAction)displayFilterSelector:(id)sender {
    
    if (self.filterButton.title == @"All") {
        self.filterButton.title = @"Filter";
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Filter" message:@"Filtering comming soon." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        [alertView release];
    }
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	self._isReloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	self._isReloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _isReloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


#pragma mark -
#pragma mark Utility Methods

- (void)cleanUp {
    self.tableView = nil;
}


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *title = self._isFiltered ? @"All" : @"Filter";
    
    self.filterButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBordered target:self action:@selector(displayFilterSelector:)];
    
    [self.filterButton retain];
    self.navigationItem.rightBarButtonItem = self.filterButton;
    
    [title release];
    [self.filterButton release];
    
    // Pull to refresh
    if (self._refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
	}
	
	//  update the last update date
	[self._refreshHeaderView refreshLastUpdatedDate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    FeedItemDetailViewController *view = [[FeedItemDetailViewController alloc] init];
    view.title = cell.textLabel.text;
    
    [self.navigationController pushViewController:view animated:YES];
    [view.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Special:Random"]]];
    
    [view release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID] autorelease];
    
    // customize cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"Feed Item %i", indexPath.row];
    cell.detailTextLabel.text = @"lsjdfljasdfljslfjasdlkfjlasdjflsdajflsadjfljasdlfjasdlkfjalsdkfjlasdjfldsajflasjdflajsdfljasdlfkjaslkdf";
    cell.detailTextLabel.numberOfLines = 2;
    
    
    return cell;
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self cleanUp];
}

- (void)dealloc {
    [self cleanUp];
    [self.filterButton release];
    [self.tableView release];
    [super dealloc];
}


@end

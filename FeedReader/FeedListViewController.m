//
//  ListFeedsVC.m
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import "FeedListViewController.h"
#import "FeedItemListViewController.h"
#import "FeedAddViewController.h"

@implementation FeedListViewController

@synthesize tableView;

- (void)didAddFeed {
    [self dismissModalViewControllerAnimated:YES];
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
    
    self.title = @"Feed Reader";
    
    UIBarButtonItem *addNewFeedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFeed:)];
    
    [addNewFeedButton retain];
    self.navigationItem.rightBarButtonItem = addNewFeedButton;
    
    [addNewFeedButton release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark Table view delegate

- (IBAction)addFeed:(id)sender {
    FeedAddViewController *feedAddViewController = [[FeedAddViewController alloc] init];
    
    feedAddViewController.delegate = self;
    
    [self presentModalViewController:feedAddViewController animated:YES];
    [feedAddViewController release];
}

#pragma mark -
#pragma mark Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Feeds";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    FeedItemListViewController *view = [[FeedItemListViewController alloc] initWithState:indexPath.row > 0];
    view.title = cell.textLabel.text;
    
    [self.navigationController pushViewController:view animated:YES];
    
    [view release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    
    TDBadgedCell *cell = [[[TDBadgedCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID] autorelease];
    
    // customize cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"All Feeds";
            break;
            
        default:
            cell.textLabel.text = [NSString stringWithFormat:@"Feed Name %i", indexPath.row];
            break;
    }
    
    int value = arc4random() % 10;
    
    if (value > 0)
        cell.badgeString = [NSString stringWithFormat:@"%i", value];
    
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
    [tableView release];
    [super dealloc];
}



@end

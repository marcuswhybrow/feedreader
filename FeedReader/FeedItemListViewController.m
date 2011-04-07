//
//  ListFeedItemsVC.m
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import "FeedItemListViewController.h"


@implementation FeedItemListViewController

@synthesize tableView;


#pragma mark -
#pragma mark Utility Methods

- (void)cleanUp {
    self.tableView = nil;
}

- (IBAction)displayFilterSelector:(id)sender {
    
}


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *b = nil;
    b = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleBordered target:self action:@selector(displayFilterSelector:)];
    self.navigationItem.rightBarButtonItem = b;
    [b release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark Table view delegate

- (IBAction)addFeed:(id)sender {
    
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID] autorelease];
    }
    
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
    [super dealloc];
}


@end

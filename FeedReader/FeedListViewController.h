//
//  ListFeedsVC.h
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedAddViewController.h"

@interface FeedListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FeedAddViewControllerDelegate> {
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;


- (IBAction)addFeed:(id)sender;
- (void)cleanUp;

@end
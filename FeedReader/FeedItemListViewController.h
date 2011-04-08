//
//  ListFeedItemsVC.h
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FeedItemListViewController : UIViewController {
    IBOutlet UITableView *tableView;
    UIBarButtonItem *filterButton;
    BOOL _isFiltered;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UIBarButtonItem *filterButton;
@property (nonatomic, readwrite) BOOL _isFiltered;


- (id)initWithState:(BOOL)isFiltered;
- (IBAction)displayFilterSelector:(id)sender;
- (void)cleanUp;


@end

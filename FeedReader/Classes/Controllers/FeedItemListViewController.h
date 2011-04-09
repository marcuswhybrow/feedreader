//
//  FeedItemListViewController.h
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"


@interface FeedItemListViewController : UIViewController <EGORefreshTableHeaderDelegate, UITableViewDelegate> {
    IBOutlet UITableView *tableView;
    UIBarButtonItem *filterButton;
    BOOL _isFiltered;
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _isReloading;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UIBarButtonItem *filterButton;
@property (nonatomic, readwrite) BOOL _isFiltered;
@property (nonatomic, retain) EGORefreshTableHeaderView *_refreshHeaderView;
@property (nonatomic, readwrite) BOOL _isReloading;


- (id)initWithState:(BOOL)isFiltered;
- (IBAction)displayFilterSelector:(id)sender;
- (void)cleanUp;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;


@end

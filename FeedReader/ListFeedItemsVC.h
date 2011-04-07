//
//  ListFeedItemsVC.h
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListFeedItemsVC : UIViewController {

    
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;


- (IBAction)displayFilterSelector:(id)sender;

- (void)cleanUp;


@end

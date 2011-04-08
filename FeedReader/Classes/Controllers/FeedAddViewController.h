//
//  FeedAddViewController.h
//  FeedReader
//
//  Created by Marcus Whybrow on 08/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FeedAddViewControllerDelegate
- (void)didAddFeed;
@end

@interface FeedAddViewController : UIViewController {
    id <FeedAddViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <FeedAddViewControllerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)save;

@end

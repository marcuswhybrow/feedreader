//
//  FeedItemDetailViewController.m
//  FeedReader
//
//  Created by Michal Konturek on 07/04/2011.
//  Copyright 2011 University of Nottingham. All rights reserved.
//

#import "FeedItemDetailViewController.h"


@implementation FeedItemDetailViewController

@synthesize webView;
@synthesize activityIndicatorView;
@synthesize backButton;
@synthesize forwardButton;

#pragma mark - UIWebViewDelegate methods

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    // YES if the web view should begin loading content; otherwise, NO.
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicatorView stopAnimating];
    [self updateNavigationButtons];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicatorView startAnimating];
}

#pragma mark - Button Actions

- (void)back:(id)sender {
    [self.webView goBack];
    [self updateNavigationButtons];
}

- (void)forward:(id)sender {
    [self.webView goForward];
    [self updateNavigationButtons];
}

- (void)updateNavigationButtons {
    [self.backButton setEnabled:[self.webView canGoBack]];
    [self.forwardButton setEnabled:[self.webView canGoForward]];
}

#pragma mark - Dealloc

- (void)dealloc {
    webView.delegate = nil;
    [webView stopLoading];
    [webView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateNavigationButtons];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

//
//  FlipsideViewController.m
//  simpleABC2
//
//  Created by dropacid on 6/10/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate=_delegate;
@synthesize toggleSwitchRandom;
@synthesize toggleSwitchLowerCase;
@synthesize segmentedColor;


- (IBAction)setABCAlphaValue{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:toggleSwitchRandom.on forKey:kOnOffToggleRandom];
    [userDefaults setBool:toggleSwitchLowerCase.on forKey:kOnOffToggleLowerCase];
    [userDefaults setObject:[NSNumber numberWithInt:segmentedColor.selectedSegmentIndex] forKey:kBoyGirlSegmented];
    
    [userDefaults synchronize];
}
- (void)dealloc
{
    [toggleSwitchRandom release];
    [toggleSwitchLowerCase release];
    [segmentedColor release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    toggleSwitchRandom.on = [userDefaults floatForKey:kOnOffToggleRandom];
    toggleSwitchLowerCase.on = [userDefaults floatForKey:kOnOffToggleLowerCase];
    self.segmentedColor.selectedSegmentIndex=[[userDefaults objectForKey:kBoyGirlSegmented] intValue];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end

//
//  FlipsideViewController.h
//  simpleABC2
//
//  Created by dropacid on 6/10/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kOnOffToggleRandom @"onOff"
#define kOnOffToggleLowerCase @"onOff2"
#define kBoyGirlSegmented @"boyGirl"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController {
    IBOutlet UISwitch *toggleSwitchRandom;
    IBOutlet UISwitch *toggleSwitchLowerCase;
    IBOutlet UISegmentedControl *segmentedColor;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) UISwitch *toggleSwitchRandom;
@property (nonatomic, retain) UISwitch *toggleSwitchLowerCase;
@property (nonatomic, retain) UISegmentedControl *segmentedColor;

- (IBAction)done:(id)sender;
- (IBAction)setABCAlphaValue;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

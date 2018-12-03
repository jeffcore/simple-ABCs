//
//  MainViewController.h
//  simpleABC2
//
//  Created by dropacid on 6/10/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "FlipsideViewController.h"
#import "LetterBrain.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate,AVAudioPlayerDelegate> {
    IBOutlet UILabel *theLetter;
    IBOutlet UIButton *theLetterSound;
    NSMutableArray *allLetters;
    NSArray *letterCaps;
    NSArray *letterLower;
    NSArray *numberNames;
    NSInteger theLetterIndex;
    NSInteger theTotalNumberOfLetters;
    bool randomUserDefault;
    AVAudioPlayer *audioPlayer;
    LetterBrain *brain;
    UIPopoverController *aPopover;
}
 
- (IBAction)getLetter:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)showInfo:(id)sender;
- (IBAction)showInfoIpad:(id)sender;
- (void)setUserDefaults;


@property (nonatomic, retain) UILabel *theLetter;
@property (nonatomic, retain) UIButton *theLetterSound;
@property (nonatomic, assign) NSInteger theLetterIndex;
@property (nonatomic, assign) UIPopoverController *aPopover;


@end

//
//  MainViewController.m
//  simpleABC2
//
//  Created by dropacid on 6/10/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize theLetter;
@synthesize theLetterSound;
@synthesize theLetterIndex;
@synthesize aPopover;

- (LetterBrain *)brain{
    if (!brain) brain = [[LetterBrain alloc] init];
    return brain;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    
    theLetterIndex=-1;
    
    UISwipeGestureRecognizer *swipeRecongnizer;
    swipeRecongnizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(foundSwipeRight:)];
    swipeRecongnizer.direction=UISwipeGestureRecognizerDirectionLeft;
    swipeRecongnizer.numberOfTouchesRequired=1;
    [self.view addGestureRecognizer:swipeRecongnizer];
    [swipeRecongnizer release];
    
    UISwipeGestureRecognizer *swipeRecongnizerLeft;
    swipeRecongnizerLeft=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(foundSwipeLeft:)];
    swipeRecongnizerLeft.direction=UISwipeGestureRecognizerDirectionRight;
    swipeRecongnizerLeft.numberOfTouchesRequired=1;
    [self.view addGestureRecognizer:swipeRecongnizerLeft];
    [swipeRecongnizerLeft release];

    
    [self setUserDefaults];
    [self getLetter:nil];

    [super viewDidLoad];
}
- (void)foundSwipeRight:(UISwipeGestureRecognizer *)recognizer{
    [self getLetter:nil];
}

- (void)foundSwipeLeft:(UISwipeGestureRecognizer *)recognizer{
    
    if (theLetterIndex==1){
        theLetterIndex=theTotalNumberOfLetters-1;
    } else if (theLetterIndex==0){
        theLetterIndex=theTotalNumberOfLetters-2; 
    } else {
        theLetterIndex-=2;
    }
        
    [self getLetter:nil];
}
- (void)setUserDefaults{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([[userDefaults objectForKey:kBoyGirlSegmented] intValue]==1){
        theLetter.textColor=[UIColor colorWithRed:0/255.0 green:19/255.0 blue:128/255.0 alpha:1];
        self.view.backgroundColor=[UIColor colorWithRed:99/255.0 green:184/255.0 blue:255/255.0 alpha:1];
        [theLetterSound setBackgroundColor:[UIColor colorWithRed:0/255.0 green:19/255.0 blue:128/255.0 alpha:1]];
        [theLetterSound setTitleColor:[UIColor colorWithRed:99/255.0 green:184/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
    } else {
        theLetter.textColor=[UIColor purpleColor];   
        self.view.backgroundColor=[UIColor colorWithRed:255/255.0 green:169/255.0 blue:204/255.0 alpha:1];
        [theLetterSound setBackgroundColor:[UIColor purpleColor]];
        [theLetterSound setTitleColor:[UIColor colorWithRed:255/255.0 green:169/255.0 blue:204/255.0 alpha:1] forState:UIControlStateNormal];
    }
    
    theLetterSound.layer.cornerRadius = 5.0f;
    
    randomUserDefault=[userDefaults boolForKey:kOnOffToggleRandom];
 
    allLetters=[[self brain] getLettersArray:[userDefaults boolForKey:kOnOffToggleLowerCase]];
    
    theTotalNumberOfLetters=[allLetters count];
    
    
    
    
  //  UIImage *normalImage = [[UIImage imageNamed:@"whiteButton.png"]stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
  //  [theLetterSound setBackgroundImage:normalImage forState:UIControlStateNormal];
    
 //   UIImage *pressedImage = [[UIImage imageNamed:@"blueButton.png"]stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
  //  [theLetterSound setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
}
- (IBAction)getLetter:(id)sender{
    NSString *letter;
   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    randomUserDefault=[userDefaults boolForKey:kOnOffToggleRandom];
    
    if (randomUserDefault){
        theLetterIndex=arc4random() % theTotalNumberOfLetters;
    } else {
        
        
        theLetterIndex++; 

        if ((theLetterIndex == theTotalNumberOfLetters) || (theLetterIndex > theTotalNumberOfLetters))  {
            theLetterIndex = 0;
        }
        
        
    }
  
    letter=[allLetters objectAtIndex:theLetterIndex];
    theLetter.text=letter;

    [letter release];
}
	
- (IBAction)doSound:(id)sender{
   // AVAudioPlayer *audioPlayer;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:[[NSString stringWithFormat:@"%@", [allLetters objectAtIndex:theLetterIndex]] uppercaseString]
                                         ofType:@"m4a"]];
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	
    [audioPlayer play];
   
  }

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self setUserDefaults];
//    [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:NO completion:nil];
    [aPopover  dismissPopoverAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
 //   [self presentModalViewController:controller animated:YES];
    [self presentViewController:controller animated:NO completion:nil];
    [controller release];
}

- (IBAction)showInfoIpad:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    aPopover = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    aPopover.popoverContentSize=CGSizeMake(320.0,460.0);
    
    aPopover.delegate = self;
    [controller release];
    
    [aPopover presentPopoverFromRect:CGRectMake(646, 891, 18, 19) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)aPopover{
    [self setUserDefaults];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [theLetter release];
    [letterCaps release];
    [letterLower release];
    [numberNames release];
    [theLetterSound release];
    [audioPlayer release];
    [aPopover release];
    [super dealloc];
}

@end

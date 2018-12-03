//
//  simpleABC2AppDelegate.h
//  simpleABC2
//
//  Created by dropacid on 6/10/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface simpleABC2AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

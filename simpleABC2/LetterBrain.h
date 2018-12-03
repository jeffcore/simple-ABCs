//
//  LetterBrain.h
//  simpleABC2
//
//  Created by dropacid on 7/4/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LetterBrain : NSObject {
    NSMutableArray *theLetters; 

    NSArray *letterCaps;
    NSArray *letterLower;
    NSArray *numberNames;
}

- (NSMutableArray *)getLettersArray:(BOOL)showLowerCaseLetters;

@end

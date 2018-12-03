//
//  LetterBrain.m
//  simpleABC2
//
//  Created by dropacid on 7/4/11.
//  Copyright 2011 Six Flavors. All rights reserved.
//

#import "LetterBrain.h"


@implementation LetterBrain


- (id) init
{
    if ( (self = [super init]) )
    {
        letterCaps=[[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil ];
        letterLower=[[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r",@"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
        numberNames=[[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
        
    }
    return self;
}
- (NSMutableArray *)getLettersArray:(BOOL)showLowerCaseLetters{
    if (showLowerCaseLetters){
        theLetters=[[NSMutableArray alloc] initWithArray:letterCaps];
        [theLetters addObjectsFromArray:letterLower];
    } else {
        theLetters=[[NSMutableArray alloc] initWithArray:letterCaps];
    }
    return theLetters;
}

@end

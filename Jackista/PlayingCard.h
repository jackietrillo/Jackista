//
//  PlayingCard.h
// 
//
//  Created by JACKIE TRILLO on 3/31/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

//suit value of card
@property (strong, nonatomic) NSString* suit;
//rank value of card
@property NSUInteger rank;

//returns the maximum rank
+ (NSUInteger)maxRank;

//returns an array of valid suits
+ (NSArray*)validSuits;

//returns an array of valid ranks
+ (NSArray*)validRanks;

//checks if there is a match and returns the points
-(int)match:(NSArray*) otherCards;

@end
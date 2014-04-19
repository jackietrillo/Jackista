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

@property (strong, nonatomic) NSString *suit;
@property NSUInteger rank;

-(int)match:(NSArray*) otherCards;

+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
+ (NSArray *)validSuits;

@end
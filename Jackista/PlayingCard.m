//
//  PlayingCard.m
//  
//
//  Created by JACKIE TRILLO on 3/31/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = suit1; // because we provide setter AND getter
@synthesize rank = rank1;

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self validRanks].count-1;
}

- (NSString *)suit
{
    return suit1 ? suit1 : @"?";
}

- (void)setSuit:(NSString*)value
{
    if ([[PlayingCard validSuits] containsObject:value]) {
        suit1 = value;
    }
}

- (NSUInteger)rank
{
    return rank1;
}

- (void)setRank:(NSUInteger)value
{
    if (value <= [PlayingCard maxRank])
    {
        rank1 = value;
    }
}

-(int)match:(NSArray*) otherCards
{
    int score = 0;
    
    if(otherCards.count == 1)
    {
        PlayingCard* otherCard = [otherCards lastObject];
        if ([self.suit isEqualToString:otherCard.suit])
        {
            score = 1;
        }
        else if (self.rank == otherCard.rank)
        {
            score = 4;
        }
    }
    
    return score;
}

@end

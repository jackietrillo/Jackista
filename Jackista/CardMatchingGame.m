//
//  CardMatchingGame.m
//  
//
//  Created by JACKIE TRILLO on 4/1/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;

@end

@implementation CardMatchingGame

#define FLIP_COST 1;
#define MISMATCH_PENALTY 2;
#define MATCH_BONUS 4;

- (NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger) cardCount usingDeck: (Deck*)deck
{
    self = [super init];
    
    if(self)
    {
        for (int i = 0; i < cardCount; i++)
        {
            Card* card = [deck drawRandomCard];
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
        
        self.displayText = @"";
    }        
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count ? self.cards[index] : nil);
}

- (void)flipCardAtIndex:(NSUInteger) index
{
    Card* card = [self cardAtIndex: index];
    
    if (!card.isUnplayable)
    {
        if (!card.isFaceUp)
        {
            for (Card* otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable)
                {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore)
                    {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore;
                        self.displayText = [NSString stringWithFormat:@"Matched %@ %@ for %d points", card.contents, otherCard.contents, matchScore];
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.displayText = [NSString stringWithFormat:@"%@ and %@ don't match! %d penality!", card.contents, otherCard.contents, 2];
                    }//end matchscore
                }
                
            }//end for
        }
        else
        {
            self.displayText = [NSString stringWithFormat:@"Flipped up %@", card.contents];
        }
        self.score -= FLIP_COST;
        card.faceUp = !card.isFaceUp;
        
    }
}


@end

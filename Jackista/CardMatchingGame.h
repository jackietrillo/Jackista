//
//  CardMatchingGame.h
//  
//
//  Created by JACKIE TRILLO on 4/1/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (strong, nonatomic) NSString *displayText;

- (id)initWithCardCount:(NSUInteger) cardCount usingDeck: (Deck*)deck;
- (void)flipCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end

//
//  Deck.h
//  
//
//  Created by JACKIE TRILLO on 3/31/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end

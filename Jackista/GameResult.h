//
//  GameResult.h
//
//
//  Created by JACKIE TRILLO on 7/7/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+(NSMutableArray *)allGameResults;
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (readwrite) int score;
@end

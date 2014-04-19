//
//  GameResult.m
//  
//
//  Created by JACKIE TRILLO on 7/7/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()

@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation GameResult

#define RESULTS_KEY @"Results"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

@synthesize score = _score;

- (id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (int)score
{
    return _score;
}

- (void)setScore:(int)score
{
    _score = score;
    _end = [NSDate date];
    [self synchronize];
}

+(NSMutableArray *)allGameResults;
{
    NSMutableArray *gameResults = [[NSMutableArray alloc] init];
    
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:RESULTS_KEY ] allValues]) {
        GameResult *gameResult = [[GameResult alloc] initFromPropertyList:plist];
        if(gameResult){
        [  gameResults addObject:gameResult];
        }
    }
    return gameResults;
}

- (id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self){
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *results = (NSDictionary*)plist;
            _start = results[START_KEY];
            _end = results[END_KEY];
            _score = [results[SCORE_KEY] intValue];
            if (!_start || !_end) self = nil;
        }
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

- (id)asPropertyList
{
    return @{ START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score) };
}

- (void)synchronize
{
    NSLog(@"method: %@", @"get the gameresults dictionary");
    NSMutableDictionary *gameResults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey: RESULTS_KEY] mutableCopy];
    
    if (!gameResults)
    {
        gameResults = [[NSMutableDictionary alloc] init];
    }
    gameResults[[self.start description]] = [self asPropertyList];
    
    NSDictionary *readit = gameResults[[self.start description]];
    NSLog(@"results: score %d date %@", [readit[SCORE_KEY] intValue], readit[START_KEY]);
    [[NSUserDefaults standardUserDefaults] setObject:gameResults forKey:RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


     
     
@end

//
//  ViewController.m

//
//  Created by JACKIE TRILLO on 2/23/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* cardButtons;
@property (strong, nonatomic) CardMatchingGame* game;
@property (weak, nonatomic) IBOutlet UILabel* scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel* flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel* displayLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem* tabItem;
@property (strong, nonatomic) GameResult* gameResult;
@end

@implementation CardGameViewController

@synthesize flipCount = _flipCount;


- (IBAction)goBackToGame:(UIStoryboardSegue*)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tabItem.title = @"Jackista";
    
}
- (int)getFlipCount
{
    return _flipCount;
}

- (void)setFlipCount:(int)count
{
    _flipCount = count;
    self.flipsLabel.text = [NSString stringWithFormat:@"flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (CardMatchingGame*)game
{
    if (!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (GameResult*)gameResult
{
    if (!_gameResult)
    {
        _gameResult = [[GameResult alloc] init];
    }
    return _gameResult;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton* cardButton in self.cardButtons)
    {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected |UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.unplayable ? 0.5 : 1.0);
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.displayLabel.text = self.game.displayText;
    }
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    self.gameResult.score= self.game.score;
    [self updateUI];
}

- (IBAction)newDeck:(id)sender
{
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
 
}

@end

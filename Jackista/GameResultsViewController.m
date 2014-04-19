//
//  GameResultsViewController.m
//
//  Created by JACKIE TRILLO on 7/7/13.
//  Copyright (c) 2013 JACKIE TRILLO. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResult.h"

@interface GameResultsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *displayText;

@end

@implementation GameResultsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateUI];
}

- (void)updateUI
{
    _displayText.text = @"";
    
    NSString *tempText = @"";
    for (GameResult *gameResult in [GameResult allGameResults]) {
        tempText =[tempText stringByAppendingFormat:@"score %d (date %@, %0gs)\n", gameResult.score, gameResult.end, round(gameResult.duration)];
    }
    
    self.displayText.text = tempText;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

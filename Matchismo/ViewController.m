//
//  ViewController.m
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic)CardMatchingGame *game;
- (IBAction)didClickNewGame:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController
-(CardMatchingGame*)game{
    if(!_game)_game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] withMode:PlayMode2CardMatchPerfect];
    return _game;
}

- (IBAction)didClickNewGame:(id)sender {
    [self.game reset];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        Card * card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
}
-(Deck*)deck{
    if(!_deck)_deck = [self createDeck];
    return _deck;
}
-(Deck*)createDeck{
    return [[PlayingCardDeck alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    NSLog(@"touchCardButton");
    [self.game chooseCardIndex:chosenButtonIndex];
    [self updateUI];
    //self.flipCount++;
}
-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card * card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = ! card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        
    }
}
-(NSString*)titleForCard:(Card*)card{
    return card.isChosen ? card.contents :@"";
}
-(UIImage*) backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end

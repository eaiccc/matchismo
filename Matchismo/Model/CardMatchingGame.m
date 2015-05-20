//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"
@interface CardMatchingGame(){
    NSUInteger cardCount;
    Deck* gameDeck;
}
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray* cards;
@end
@implementation CardMatchingGame

-(NSMutableArray*)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck withMode:(PlayMode)mode{
    self = [super init];
    if(self){
        cardCount = count;
        gameDeck = deck;
        _mode = mode;
        if (![self drawCards]) {
            self = nil;
        }
    }
    return self;
}

static const int MISMATCH_PENALTY= 2;
static const int MATCH_BONUS= 4;
static const int COST_TO_CHOOSE= 1;

-(void)chooseCardIndex:(NSUInteger)index{
    Card * card = [self cardAtIndex:index];
    if (!card.isMatched){
        if (card. isChosen){
            card.chosen = NO;
        }else{
            for (Card * otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card*)cardAtIndex:(NSUInteger)index{
    return (index< [self.cards count])?self.cards[index]:nil;
}

-(void)reset{
    self.score = 0;
    [self.cards removeAllObjects];
    [self drawCards];
}
-(BOOL)drawCards{
    if (self.mode == PlayMode2CardMatchPerfect) {
        return  [self drawCardsPairs];
    }else{
        return  [self drawCardsRandom];
    }

    return YES;
}
-(BOOL)drawCardsPairs{
    for (int i = 0; i<cardCount ; i++){
        Card *card = [gameDeck drawRandomCard];
        if(card){
            [self.cards addObject:card]; //add twice
            [(PlayingCard*)card setMode:PlayMode2CardMatchPerfect];
            PlayingCard* copyCard = [(PlayingCard*)card copy];
            [copyCard setMode:PlayMode2CardMatchPerfect];
            [self.cards addObject:copyCard];
        }else{
            return NO;
            //break;
        }
    }
    //shuffle it
    for (NSUInteger i = 0; i< cardCount;  i++) {
        NSUInteger nElements = cardCount -i;
        NSUInteger  n = (arc4random() % nElements)+i;
        [self.cards exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return YES;
}
-(BOOL)drawCardsRandom{
    for (int i = 0; i<cardCount ; i++){
        Card *card = [gameDeck drawRandomCard];
        if(card){
            [self.cards addObject:card];
        }else{
            return NO;
            //break;
        }
    }
    return YES;
}


@end

//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by ChangLink on 2015/5/7.
//  Copyright (c) 2015年 Neurv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject



-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;
-(void)chooseCardIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) NSInteger score;

@end

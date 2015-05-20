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
typedef NS_ENUM(NSUInteger, PlayMode) {
    PlayMode2CardMatchSuit,
    PlayMode2CardMatchRank,
    PlayMode2CardMatchPerfect,
    PlayMode3CardMatchSuit,
};


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck withMode:(PlayMode)mode;
-(void)chooseCardIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;
-(void)reset;
@property (nonatomic, readonly) NSInteger score;
@property (atomic)PlayMode mode;
@end
